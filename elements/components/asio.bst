kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

variables:
  asio-tag: asio-1-32-0

sources:
- kind: tar
  url: github:chriskohlhoff/asio/archive/refs/tags/%{asio-tag}.tar.gz
  base-dir: "asio-%{asio-tag}/asio"
  ref: f1b94b80eeb00bb63a3c8cef5047d4e409df4d8a3fe502305976965827d95672
