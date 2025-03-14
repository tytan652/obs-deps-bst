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
  track: intel-onevpl-24.4.4
  ref: 7277c25ec5362e92d2fa334e2ce356c473ba4778
- kind: patch
  path: patches/vpl-gpu-rt/010-vpl-gpu-rt-disable-verbose-makefile.patch
