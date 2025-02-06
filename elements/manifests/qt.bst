kind: collect_manifest
description: Generate a JSON file to list sources used to build Qt dependencies

build-depends:
- qt.bst

config:
  path: "/app/qt.json"
