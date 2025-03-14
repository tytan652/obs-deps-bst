kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  mbedtls-version: 3.6.2
  cmake-local: >-
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DUSE_SHARED_MBEDTLS_LIBRARY=ON
    -DUSE_STATIC_MBEDTLS_LIBRARY=OFF
    -DENABLE_TESTING=OFF
    -DENABLE_PROGRAMS=OFF

sources:
# MbedTLS provide a release tarball that allows to avoid maintaining git submodules
- kind: tar
  url:
    github:Mbed-TLS/mbedtls/releases/download/mbedtls-%{mbedtls-version}/mbedtls-%{mbedtls-version}.tar.bz2
  ref: 8b54fb9bcf4d5a7078028e0520acddefb7900b3e66fec7f7175bb5b7d85ccdca
- kind: patch
  path: patches/mbedtls/0001-array-bounds-error-fix.patch
