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
  # VVC support in libva is required since 24.3 and is not available in the version of libva provided by Freedesktop 23.08
  # TODO: Update to 24.3 or later once libva is updated (e.g. Freedesktop SDK 24.08)
  track: intel-onevpl-24.2.5
  ref: e0b981d1bf8ca4f9d346089d530cc149c09e10df
- kind: patch
  path: patches/vpl-gpu-rt/010-vpl-gpu-rt-disable-verbose-makefile.patch
