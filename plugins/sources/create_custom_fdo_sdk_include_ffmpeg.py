"""
create_custom_fdo_sdk_include_ffmpeg - Freedesktop SDK base FFmpeg dependencies and variables as an include
=========================================

This source is only meant to be used with 'elements/freedesktop-sdk.bst' as a
junction of the Freedesktop SDK project.

It reads 'elements/include/ffmpeg.yml' and 'elements/components/ffmpeg.bst'
from Freedesktop SDK and creates 'elements/include/ffmpeg-custom.yml' in
the junction.

This created include file contains the dependencies list and variables of
Freedesktop SDK base FFmpeg.

The purpose of this file is to be used as a base for OBS Studio FFmpeg build
by adding dependencies and flags to it.

**Available variables in the include:**
  - conf-local: Main Freedesktop SDK FFmpeg config flags, some flags need
  to be re-added see next list
  - fdo-encoders: Freedesktop SDK allowed encoders
  - fdo-decoders: Freedesktop SDK allowed decoders
  - fdo-conf-extra: Base Freedesktop SDK FFmpeg extra config flags, some
  flags need to be re-added see next list

**Config option to re-add in the FFmpeg element configure command:**
  - '--prefix="%{prefix}"'
  - '--libdir="%{libdir}"'
  - '--arch="%{arch}"'
  - '%{conf-local}'
  - '%{fdo-conf-extra}'
  - '--enable-encoder=%{fdo-encoders}'
  - '--enable-decoder=%{fdo-decoders}'
  - '--disable-decoder=h264,hevc' (optional, also disables hwaccels)
"""

import os
from ruamel.yaml import YAML
from buildstream import Source, SourceError
from buildstream import utils


class CreateCustomFdoSdkIncludeFFmpeg(Source):
    BST_MIN_VERSION = "2.0"

    BST_REQUIRES_PREVIOUS_SOURCES_STAGE = True

    FDO_SDK_INCLUDE_FFMPEG_PATH = "elements/include/ffmpeg.yml"
    FDO_SDK_BASE_FFMPEG_PATH = "elements/components/ffmpeg.bst"
    CUSTOM_INCLUDE_FFMPEG_PATH = "elements/include/ffmpeg-custom.yml"

    def configure(self, node):
        pass

    def preflight(self):
        self.path = os.path.realpath(__file__)
        self.yaml = YAML()

    def get_unique_key(self):
        # Unavoidable use of private API to get Freedesktop SDK digest
        with self._cache_directory() as directory:
            self.include_digest = directory._get_digest()

        return [
            utils.sha256sum(self.path),
            self.CUSTOM_INCLUDE_FFMPEG_PATH,
            self.include_digest.hash,
        ]

    def load_ref(self, node):
        pass

    def is_resolved(self):
        return True

    def is_cached(self):
        return True

    def get_ref(self):
        return None

    def set_ref(self, ref, node):
        pass

    def fetch(self):
        pass

    def stage(self, directory):
        with self.timed_activity(
            f"Creating '{self.CUSTOM_INCLUDE_FFMPEG_PATH}' based on '{self.FDO_SDK_INCLUDE_FFMPEG_PATH}' and '{self.FDO_SDK_BASE_FFMPEG_PATH}'"
        ):
            data = {}
            try:
                with open(
                    os.path.join(directory, self.FDO_SDK_INCLUDE_FFMPEG_PATH),
                    mode="r",
                    encoding="utf-8",
                ) as include:
                    data = self.yaml.load(include)

            except IOError as e:
                raise SourceError(
                    f"'{self.FDO_SDK_INCLUDE_FFMPEG_PATH}' not found",
                    reason="include-ffmpeg-not-found",
                ) from e

            # Adapt dependencies by adding the junction name
            for depends in ["build-depends", "depends"]:
                data[depends] = add_junction(data[depends])

            # Remove variables relying only on another variable
            for variable in ["ffmpeg-arch", "(?)"]:
                data["variables"].pop(variable)

            # Remove variable usage in conf-local
            old_conf_local = data["variables"]["conf-local"].split(" ")
            conf_local = []
            for s in old_conf_local:
                if not (
                    s.startswith("--prefix")  # Removed to be modifiable
                    or s.startswith("--libdir")  # Removed to be modifiable
                    or s.startswith("--arch")
                ):  # Relies on a removed variable
                    conf_local.append(s)

            data["variables"]["conf-local"] = " ".join(conf_local)

            # Remove conf-extra which is just a placeholder for the config item
            data["variables"].pop("conf-extra")

            # Remove sources (we use our own) and cpe if present since it is bound to removed sources
            data.pop("sources")
            if "cpe" in data["public"]:
                data["public"].pop("cpe")

            # Remove split-rules since they rely on variable and also we will apply our own
            data["public"]["bst"].pop("split-rules")

            # Remove bst if empty and public if bst was the only remaining item
            if len(data["public"]["bst"].items()) == 0:
                if len(data["public"].items()) == 1:
                    data.pop("public")
                else:
                    data["public"].pop["bst"]

            # Remove config since it relies on variable
            data.pop("config")

            try:
                with open(
                    os.path.join(directory, self.FDO_SDK_BASE_FFMPEG_PATH),
                    mode="r",
                    encoding="utf-8",
                ) as element:
                    base = self.yaml.load(element)

                    # Add base FFmpeg dependencies
                    for depends in ["build-depends", "depends"]:
                        if depends not in base:
                            continue

                        # Adapt dependencies by adding the junction name
                        for depend in base[
                            depends
                        ][
                            "(>)"
                        ]:  # '(>)' is always present to avoid overriding include dependencies
                            data[depends].append(f"freedesktop-sdk.bst:{depend}")

                    # Add base FFmpeg variables with a prefix (e.g. allowed encoders/decoders and extra option flags)
                    for name, value in base["variables"].items():
                        if name in ["encoders", "decoders"]:
                            extra_name = f"extra-{name}"

                            # Remove variables usage from allowed encoders/decoders lists
                            value = value.replace(",%{" + extra_name + "}", "")

                            # Merge extra encoder/decoders to it if non-empty
                            if extra_name in base["variables"]:
                                extra = base["variables"][extra_name]
                                if len(extra) != 0:
                                    value += f",{extra}"

                        # Skip extra encoder/decoders since it was merged in non-extra
                        if name.startswith("extra-") and name.endswith("coders"):
                            continue

                        # Remove variables usage from extra option flags and remove H264 and HEVC from the disable argument
                        if name == "conf-extra":
                            value = (
                                value.replace(" --enable-encoder=%{" + "encoders}", "")
                                .replace(" --enable-decoder=%{" + "decoders}", "")
                                .replace(
                                    'disable-decoder="h264,hevc,', 'disable-decoder="'
                                )
                            )

                        data["variables"][f"fdo-{name}"] = value

            except IOError as e:
                raise SourceError(
                    f"'{self.FDO_SDK_BASE_FFMPEG_PATH}' not found",
                    reason="ffmpeg-element-not-found",
                ) from e

            try:
                with open(
                    os.path.join(directory, self.CUSTOM_INCLUDE_FFMPEG_PATH),
                    mode="w",
                    encoding="utf-8",
                ) as include:
                    self.yaml.dump(data, include)

            except IOError as e:
                raise SourceError(
                    f"Unable to create '{self.CUSTOM_INCLUDE_FFMPEG_PATH}'",
                    reason="custom-include-not-created",
                ) from e


def add_junction(depends_array):
    for i, s in enumerate(depends_array):
        depends_array[i] = f"freedesktop-sdk.bst:{s}"
    return depends_array


def setup():
    return CreateCustomFdoSdkIncludeFFmpeg
