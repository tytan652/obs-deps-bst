kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  mbedtls-version: 3.6.4
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
  ref: ec35b18a6c593cf98c3e30db8b98ff93e8940a8c4e690e66b41dfc011d678110
- kind: patch
  path: patches/mbedtls/0001-array-bounds-error-fix.patch
