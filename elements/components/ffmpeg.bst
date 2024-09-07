kind: make
description: FFmpeg component based on Freedesktop SDK version

(@):
# Include file created by 'create_custom_fdo_sdk_include_ffmpeg' source in freedesktop-sdk junction.
- freedesktop-sdk.bst:elements/include/ffmpeg-custom.yml

build-depends:
  (>):
  - components/nv-codec.bst

depends:
  (>):
  - components/librist.bst
  - components/srt.bst
  - components/svt-av1.bst
  - components/x264.bst

variables:
  obs-conf-extra: >-
    --enable-gnutls
    --enable-gpl
    --enable-libx264
    --enable-libopus
    --enable-libvorbis
    --enable-libvpx
    --enable-librist
    --enable-libsrt
    --enable-libaom
    --enable-libsvtav1
    --enable-nvenc
    --disable-doc
    --disable-programs
    --disable-devices

  # Only x264 is disabled in Freedesktop SDK
  obs-missing-encoders: libx264,libx264rgb

  # FFmpeg 7.0 requires more recent Vulkan headers than what Freedesktop SDK 23.08 provides
  # TODO: Remove once the header is update (e.g. Freedesktop SDK 24.08)
  fixup-conf-extra: >-
    --disable-vulkan

  conf-extra: >-
    --enable-encoder=%{fdo-encoders},%{obs-missing-encoders}
    --enable-decoder=%{fdo-decoders}
    %{obs-conf-extra}
    %{fdo-conf-extra}
    %{fixup-conf-extra}

config:
  configure-commands:
  - ./configure --prefix="%{prefix}" --libdir="%{libdir}" --arch="%{arch}" %{conf-local}
    %{conf-extra}

public:
  bst:
    split-rules:
      # Put FFmpeg examples as extra
      extra:
      - "%{datadir}"
      - "%{datadir}/**"

sources:
- kind: git_repo
  url: github:FFmpeg/FFmpeg.git
  track: n7.0.2
  ref: e3a61e91030696348b56361bdf80ea358aef4a19
- kind: patch
  path: patches/ffmpeg/0001-flvdec-handle-unknown.patch
- kind: patch
  path: patches/ffmpeg/0002-libaomenc-presets.patch
- kind: patch
  path: patches/ffmpeg/0010-fdo-people-fdk-aac-gpl-compatible.patch
