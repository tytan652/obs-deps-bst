kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --disable-doc
    --disable-examples

config:
  install-commands:
    (>):
    # Delete the installed README
    - |
      rm -f '%{install-root}%{datadir}/doc/rnnoise/README'

public:
  bst:
    split-rules:
      runtime:
        (>):
        - "%{datadir}"
        - "%{datadir}/**"

sources:
- kind: git_repo
  url: github:xiph/rnnoise.git
  ref: 085d8f484af6141b1b88281a4043fb9215cead01
