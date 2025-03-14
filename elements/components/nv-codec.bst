kind: make

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{lib}"

sources:
- kind: git_repo
  url: github:ffmpeg/nv-codec-headers.git
  track: n13.0.19.0
  ref: e844e5b26f46bb77479f063029595293aa8f812d
