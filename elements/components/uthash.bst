kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst

config:
  install-commands:
  - |
    install -dm755 %{install-root}%{includedir}

    for h in src/*.h; do
      install -m644 ${h} %{install-root}%{includedir}/
    done

sources:
- kind: git_repo
  url: github:troydhanson/uthash.git
  track: v2.3.0
  ref: e493aa90a2833b4655927598f169c31cfcdf7861
