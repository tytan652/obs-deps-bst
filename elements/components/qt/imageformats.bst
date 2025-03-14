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
  ref: d2a1bbb84707b8a0aec29227b170be00f04383fbf2361943596d09e7e443c8e1
