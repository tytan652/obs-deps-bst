kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DAJANTV2_BUILD_OPENSOURCE=ON
    -DAJANTV2_BUILD_SHARED=ON
    -DAJANTV2_DISABLE_DEMOS=ON
    -DAJANTV2_DISABLE_DRIVER=ON
    -DAJANTV2_DISABLE_PLUGINS=ON
    -DAJANTV2_DISABLE_TESTS=ON
    -DAJANTV2_DISABLE_TOOLS=ON
    -DAJA_INSTALL_CMAKE=OFF
    -DAJA_INSTALL_HEADERS=ON
    -DAJA_INSTALL_MISC=OFF
    -DAJA_INSTALL_SOURCES=OFF

sources:
- kind: git_repo
  url: github:aja-video/libajantv2.git
  track: ntv2_17_0_1
  ref: b6acce6b135c3d9ae7a2bce966180b159ced619f
