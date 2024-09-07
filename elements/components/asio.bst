kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

variables:
  asio-tag: asio-1-31-0

sources:
- kind: tar
  url: github:chriskohlhoff/asio/archive/refs/tags/%{asio-tag}.tar.gz
  base-dir: "asio-%{asio-tag}/asio"
  ref: 530540f973498c2d297771af1bc852f69b27509bbb56bc7ac3309c928373286f
