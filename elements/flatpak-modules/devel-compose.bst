kind: compose
description: Composition to allow only headers, pkg-config files and CMake packages from non-Qt dependencies

config:
  exclude:
    - debug
    - devtools
    - doc
    - exec-blocklist
    - extra
    - runtime

build-depends:
- deps.bst
