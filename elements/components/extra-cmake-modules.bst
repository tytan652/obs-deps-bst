kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING:BOOL=OFF
    -DBUILD_HTML_DOCS:BOOL=OFF
    -DBUILD_MAN_DOCS:BOOL=OFF
    -DBUILD_QTHELP_DOCS:BOOL=OFF

sources:
- kind: git_repo
  url: github:KDE/extra-cmake-modules.git
  track: v6.13.0
  ref: 1f820dc98d0a520c175433bcbb0098327d82aac6
