kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/python3.bst
- components/luajit.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    --without-boost
    --without-pcre
    --without-alllang
    --with-lua=%{bindir}/luajit
    --with-luaincl=%{includedir}/luajit-2.1
    --with-python3

public:
  bst:
    split-rules:
      devtools:
        - "%{bindir}"
        - "%{bindir}/**"
        - "%{debugdir}"
        - "%{debugdir}/**"
        - "%{datadir}"
        - "%{datadir}/**"

sources:
- kind: tar
  url: sourceforge_prdl:swig/swig-4.0.2.tar.gz
  ref: d53be9730d8d58a16bf0cbd1f8ac0c0c3e1090573168bfa151b01eb47fa906fc
