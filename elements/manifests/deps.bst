kind: collect_manifest
description: Generate a JSON file to list sources used to build non-Qt dependencies

build-depends:
- deps.bst

config:
  path: "/app/deps.json"
