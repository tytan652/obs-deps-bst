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
  ref: d1d5f90e8885fc70d63ac55a4ce4d9a2688562033a000bc4aff9320f5f551871
