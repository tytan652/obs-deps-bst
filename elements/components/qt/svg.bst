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
  ref: 4acb1e576eca55e955cf2b0d15c914a200df290e737accd7c1901fa1e33a25c7
