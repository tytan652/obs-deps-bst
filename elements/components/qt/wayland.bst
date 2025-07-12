kind: cmake

(@):
- elements/include/qt.yml

depends:
  (>):
  - freedesktop-sdk.bst:components/libdrm.bst
  - freedesktop-sdk.bst:components/libxkbcommon.bst
  - freedesktop-sdk.bst:components/mesa-headers.bst
  - freedesktop-sdk.bst:components/vulkan-icd-loader.bst
  - freedesktop-sdk.bst:components/wayland.bst
  - components/qt/base.bst

variables:
  cmake-local: >-
    -DFEATURE_wayland_client=ON
    -DFEATURE_wayland_server=OFF
    -DFEATURE_wayland_egl=ON
    -DFEATURE_wayland_brcm=OFF
    -DFEATURE_wayland_drm_egl_server_buffer=ON
    -DFEATURE_wayland_libhybris_egl_server_buffer=OFF
    -DFEATURE_wayland_dmabuf_server_buffer=ON
    -DFEATURE_wayland_shm_emulation_server_buffer=ON
    -DFEATURE_wayland_vulkan_server_buffer=OFF
    -DFEATURE_wayland_text_input_v4_wip=OFF
    -DFEATURE_wayland_client_xdg_shell=ON
    -DFEATURE_wayland_client_ivi_shell=OFF
    -DFEATURE_wayland_client_wl_shell=OFF
    -DFEATURE_wayland_client_qt_shell=OFF
    -DFEATURE_egl_extension_platform_wayland=ON

sources:
- kind: tar
  url:
    qt_archive:%{qt-api-version}/%{qt-version}/submodules/qtwayland-everywhere-src-%{qt-version}.tar.xz
  ref: 5e46157908295f2bf924462d8c0855b0508ba338ced9e810891fefa295dc9647
