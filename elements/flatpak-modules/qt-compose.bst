kind: compose
description: Composition for the OBS Studio Qt dependencies

config:
  exclude:
    - doc
    - exec-blocklist
    - extra

build-depends:
- qt.bst
- manifests/qt.bst
