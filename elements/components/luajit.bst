kind: make

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/git-minimal.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  # Build amalgamation as shared library without early stripping
  make: make amalg BUILDMODE=dynamic TARGET_STRIP=" @:" %{make-args}

public:
  bst:
    split-rules:
      exec-blocklist:
        - "%{bindir}"
        - "%{bindir}/**"
        - "%{debugdir}/bin"
        - "%{debugdir}/bin/**"

      runtime:
        (>):
        - "%{datadir}"
        - "%{datadir}/**"
        - "%{libdir}/lua"
        - "%{libdir}/lua/**"

sources:
- kind: git_repo
  url: github:LuaJIT/LuaJIT.git
  ref: a4f56a459a588ae768801074b46ba0adcfb49eb1
