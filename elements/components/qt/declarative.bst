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
  ref: 144d876adc8bb55909735143e678d1e24eadcd0a380a0186792d88b731346d56
