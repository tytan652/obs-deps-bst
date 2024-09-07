kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/nasm.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  cmake-local: >-
    -DNATIVE=OFF
    -DENABLE_NASM=ON
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_APPS=OFF
    -DBUILD_DEC=ON
    -DBUILD_ENC=ON
    -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: gitlab:AOMediaCodec/SVT-AV1.git
  track: v2.2.1
  ref: 55a01def732bb9e7016d23cc512384f7a88d6e86
