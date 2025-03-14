kind: make

build-depends:
- freedesktop-sdk.bst:components/git-minimal.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  # Build amalgamation as shared library without early stripping
  make: make amalg BUILDMODE=dynamic TARGET_STRIP=" @:" %{make-args}

public:
  bst:
    split-rules:
      exec-blocklist:
        - "%{bindir}"
        - "%{bindir}/**"
        - "%{debugdir}%{bindir}"
        - "%{debugdir}%{bindir}/**"

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
