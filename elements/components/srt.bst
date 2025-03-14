kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:components/openssl.bst

variables:
  cmake-local: >-
    %{srt-cmake}
    -DENABLE_SHARED=ON
    -DENABLE_STATIC=OFF
    -DENABLE_APPS=OFF
    -DENABLE_LOGGING=OFF

public:
  bst:
    split-rules:
      exec-blocklist:
      - "%{bindir}"
      - "%{bindir}/**"
      - "%{debugdir}%{bindir}"
      - "%{debugdir}%{bindir}/**"

sources:
- kind: git_repo
  url: github:Haivision/srt.git
  track: v1.5.4
  ref: a8c6b65520f814c5bd8f801be48c33ceece7c4a6
