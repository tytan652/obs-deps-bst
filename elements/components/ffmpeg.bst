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

  conf-extra: >-
    --enable-encoder=%{fdo-encoders},%{obs-missing-encoders}
    --enable-decoder=%{fdo-decoders}
    %{obs-conf-extra}
    %{fdo-conf-extra}

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
  track: n7.1
  ref: b08d7969c550a804a59511c7b83f2dd8cc0499b8
- kind: patch
  path: patches/ffmpeg/0001-flvdec-handle-unknown.patch
- kind: patch
  path: patches/ffmpeg/0002-libaomenc-presets.patch
- kind: patch
  path: patches/ffmpeg/0010-fdo-people-fdk-aac-gpl-compatible.patch
