kind: cmake

(@):
- elements/include/qt.yml

build-depends:
  (>):
  - freedesktop-sdk.bst:components/libtiff.bst
  - freedesktop-sdk.bst:components/libwebp.bst

depends:
  (>):
  - components/qt/base.bst

variables:
  cmake-local: >-
    -DFEATURE_jasper=OFF
    -DFEATURE_mng=OFF
    -DFEATURE_tiff=ON
    -DFEATURE_system_tiff=ON
    -DFEATURE_webp=ON
    -DFEATURE_system_webp=ON

sources:
- kind: tar
  url:
    qt_archive:%{qt-api-version}/%{qt-version}/submodules/qtimageformats-everywhere-src-%{qt-version}.tar.xz
  ref: 3ca5ea60176603ce6ffc1bff59a4dcea139375233ce8e5e86c38f4e84c44627c
