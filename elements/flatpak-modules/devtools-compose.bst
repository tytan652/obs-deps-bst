kind: compose
description: Composition to allow only tools used to build OBS Studio from non-Qt dependencies

config:
  include:
    - devtools
  exclude:
    - debug
    - devel
    - doc
    - exec-blocklist
    - extra

build-depends:
- deps.bst
