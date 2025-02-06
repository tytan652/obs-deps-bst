kind: cmake

(@):
- elements/include/qt.yml

depends:
  (>):
  - components/qt/base.bst

sources:
- kind: tar
  url: 
    qt_archive:%{qt-api-version}/%{qt-version}/submodules/qtlanguageserver-everywhere-src-%{qt-version}.tar.xz
  ref: 1021b4b9024bd23bef86292f4b6c15cc7db620b6c47be8cb6e539bfae7f6cf8c
