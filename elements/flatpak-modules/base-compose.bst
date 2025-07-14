kind: compose
description: Composition to allow only shared libraries and debug symbols from non-Qt dependencies

config:
  exclude:
    - devel
    - devtools
    - doc
    - exec-blocklist
    - extra

build-depends:
- deps.bst
- manifests/deps.bst
