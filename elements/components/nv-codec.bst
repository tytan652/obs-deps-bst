kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{lib}"

sources:
- kind: git_repo
  url: github:ffmpeg/nv-codec-headers.git
  track: n12.2.72.0
  ref: c69278340ab1d5559c7d7bf0edf615dc33ddbba7
