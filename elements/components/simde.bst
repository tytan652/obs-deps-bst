kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

variables:
  meson-local: >-
    -Dtests=false


sources:
- kind: git_repo
  url: github:simd-everywhere/simde.git
  track: v0.8.2
  ref: 71fd833d9666141edcd1d3c109a80e228303d8d7
