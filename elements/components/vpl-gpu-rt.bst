kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:components/libva.bst

variables:
  cmake-local: >-
    -DBUILD_RUNTIME=ON
    -DBUILD_TESTS=OFF
    -DBUILD_TOOLS=OFF

public:
  bst:
    split-rules:
      runtime:
        (>):
        - "%{libdir}/libmfx-gen"
        - "%{libdir}/libmfx-gen/**"

sources:
- kind: git_repo
  url: github:intel/vpl-gpu-rt.git
  track: intel-onevpl-24.3.4
  ref: fcad0a923c5d7d7483eb993378f7055a1b348241
- kind: patch
  path: patches/vpl-gpu-rt/010-vpl-gpu-rt-disable-verbose-makefile.patch
