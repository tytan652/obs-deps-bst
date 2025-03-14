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
  ref: 9eeb74ac15334c08777548c01e4ede80a4e2d36f1ebcb322423f24f14c2785fb
