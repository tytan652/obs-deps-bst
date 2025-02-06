kind: cmake

(@):
- elements/include/qt.yml

depends:
  (>):
  - components/qt/base.bst

sources:
- kind: tar
  url: 
    qt_archive:%{qt-api-version}/%{qt-version}/submodules/qtshadertools-everywhere-src-%{qt-version}.tar.xz
  ref: 8c0909d63bb33cb863c0de5a823cd4ad3489858023ab81a7fe84080c3d3ca1e6
