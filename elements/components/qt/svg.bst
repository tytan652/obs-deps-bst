kind: cmake

(@):
- elements/include/qt.yml

depends:
  (>):
  - components/qt/base.bst

sources:
- kind: tar
  url: 
    qt_archive:%{qt-api-version}/%{qt-version}/submodules/qtsvg-everywhere-src-%{qt-version}.tar.xz
  ref: aa2579f21ca66d19cbcf31d87e9067e07932635d36869c8239d4decd0a9dc1fa
