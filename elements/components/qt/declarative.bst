kind: cmake

(@):
- elements/include/qt.yml

build-depends:
  (>):
  - components/qt/languageserver.bst
  - components/qt/shadertools.bst
  - components/qt/svg.bst

depends:
  (>):
  - components/qt/base.bst

variables:
  cmake-local: >-
    -DFEATURE_qml_debug=OFF
    -DFEATURE_quickcontrols2_basic=ON
    -DFEATURE_quickcontrols2_fusion=ON
    -DFEATURE_quickcontrols2_imagine=OFF
    -DFEATURE_quickcontrols2_material=OFF
    -DFEATURE_quickcontrols2_universal=OFF

sources:
- kind: tar
  url:
    qt_archive:%{qt-api-version}/%{qt-version}/submodules/qtdeclarative-everywhere-src-%{qt-version}.tar.xz
  ref: 05207b2cfcf2ca74321165e81fc382ca289340d52de74ca2bad4c2b124a792f3
