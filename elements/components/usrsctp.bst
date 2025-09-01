kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  # Disable SCTP IP code. Packets are handled by WebRTC so we don't need it
  cmake-local: >-
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -Dsctp_build_shared_lib=ON
    -Dsctp_build_programs=OFF
    -Dsctp_inet=OFF
    -Dsctp_inet6=OFF
    -Dsctp_werror=OFF

sources:
- kind: git_repo
  url: github:sctplab/usrsctp.git
  track: 0.9.5.0
  ref: 07f871bda23943c43c9e74cc54f25130459de830
