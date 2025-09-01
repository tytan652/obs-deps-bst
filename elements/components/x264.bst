kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/nasm.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --prefix="%{prefix}"
    --libdir="%{libdir}"
    --host=%{triplet}
    --enable-shared
    --enable-pic
    --disable-lsmash
    --disable-ffms
    --disable-gpac
    --disable-interlaced
    --disable-lavf
    --disable-cli

config:
  configure-commands:
  - ./configure %{conf-local}

sources:
- kind: git_repo
  url: code_videolan:videolan/x264.git
  ref: eaa68fad9e5d201d42fde51665f2d137ae96baf0
