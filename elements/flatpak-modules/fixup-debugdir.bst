kind: script
description: Fixup to debug directory with symlink to the same place as a Flatpak build

build-depends:
  - deps.bst

config:
  root-read-only: true

  commands:
  - |
    if [ -d "%{debugdir}%{appdir}" ]; then
      for element_path in %{debugdir}%{appdir}/*; do
        element=$(basename ${element_path})
        mkdir -p %{install-root}%{debugdir}%{appdir}/${element}
        ln -sr %{install-root}%{debugdir}%{appdir}/${element} %{install-root}%{debugdir}/${element}
      done
    fi
