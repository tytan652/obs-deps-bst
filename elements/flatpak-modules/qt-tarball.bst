kind: filter
description: Filter to generate the Qt tarball with only /app

config:
  include:
  - app

build-depends:
- flatpak-modules/qt-compose.bst
