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
  track: v1.5.3
  ref: 09f35c0f1743e23f514cb41444504a7faeacf89e
