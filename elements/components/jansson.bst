kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DJANSSON_BUILD_SHARED_LIBS=ON
    -DJANSSON_BUILD_DOCS=OFF
    -DJANSSON_EXAMPLES=OFF
    -DJANSSON_WITHOUT_TESTS=ON

sources:
- kind: git_repo
  url: github:akheron/jansson.git
  track: v2.14
  ref: 684e18c927e89615c2d501737e90018f4930d6c5
