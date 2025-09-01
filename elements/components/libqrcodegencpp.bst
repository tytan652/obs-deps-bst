kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  qrcodegen-version: 1.8.0
  cmake-local: -DBUILD_SHARED_LIBS=ON
  make-install: env DESTDIR="%{install-root}" cmake --install %{build-dir} --component qrcodegencpp

sources:
- kind: tar
  url: github:nayuki/QR-Code-generator/archive/refs/tags/v%{qrcodegen-version}.tar.gz
  ref: 2ec0a4d33d6f521c942eeaf473d42d5fe139abcfa57d2beffe10c5cf7d34ae60
- kind: tar
  url: github:EasyCoding/qrcodegen-cmake/archive/refs/tags/v%{qrcodegen-version}-cmake3.tar.gz
  ref: 2037b0596e5651ce020f4d36e958d24672dbee75631bdb09ae8a45659121f4d0
