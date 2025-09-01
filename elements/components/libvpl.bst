kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DENABLE_LIBDIR_IN_RUNTIME_SEARCH=ON
    -DINSTALL_DEV=ON
    -DBUILD_EXPERIMENTAL=OFF
    -DBUILD_EXAMPLES=OFF

public:
  bst:
    split-rules:
      # Put the vars.sh script in etc and examples as extra
      extra:
      - "%{sysconfdir}"
      - "%{sysconfdir}/**"
      - "%{datadir}/vpl/examples"
      - "%{datadir}/vpl/examples/**"
      runtime:
        (>):
        - "%{datadir}"
        - "%{datadir}/**"

sources:
- kind: git_repo
  url: github:intel/libvpl.git
  track: v2.14.0
  ref: 025d43d086a3e663184cb49febe86152bf05409f
