kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- components/plog.bst

depends:
- freedesktop-sdk.bst:components/libnice.bst
- freedesktop-sdk.bst:components/libsrtp2.bst
- freedesktop-sdk.bst:components/openssl.bst
- components/usrsctp.bst

variables:
  cmake-local: >-
    -DPREFER_SYSTEM_LIB=ON
    -DUSE_NICE=ON
    -DNO_WEBSOCKET=ON
    -DNO_EXAMPLES=ON
    -DNO_TESTS=ON

sources:
- kind: git_repo
  url: github:paullouisageneau/libdatachannel.git
  track: v0.21.1
  ref: 898bdffe7340134f0891633cc7a6f6d2132c31c3
