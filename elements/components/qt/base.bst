kind: cmake

(@):
- elements/include/qt.yml

# NOTE: Qt plugin-only dependencies should be put as build dependencies
build-depends:
  (>):
  - freedesktop-sdk.bst:components/jpeg.bst
  - freedesktop-sdk.bst:components/libevdev.bst
  - freedesktop-sdk.bst:components/libinput.bst
  - freedesktop-sdk.bst:components/mtdev.bst
  - freedesktop-sdk.bst:components/xcb-util-cursor.bst
  - freedesktop-sdk.bst:components/xcb-util-image.bst
  - freedesktop-sdk.bst:components/xcb-util-keysyms.bst
  - freedesktop-sdk.bst:components/xcb-util-renderutil.bst
  - freedesktop-sdk.bst:components/xcb-util-wm.bst
  - freedesktop-sdk.bst:components/xcb-util.bst
  - freedesktop-sdk.bst:components/xorg-lib-sm.bst
  - freedesktop-sdk.bst:components/xorg-lib-x11.bst
  - freedesktop-sdk.bst:components/xorg-lib-xcb.bst

depends:
  (>):
  - freedesktop-sdk.bst:components/at-spi2-core.bst
  - freedesktop-sdk.bst:components/fontconfig.bst
  - freedesktop-sdk.bst:components/freetype.bst
  - freedesktop-sdk.bst:components/glib.bst
  - freedesktop-sdk.bst:components/harfbuzz.bst
  - freedesktop-sdk.bst:components/libdbus.bst
  - freedesktop-sdk.bst:components/libpng.bst
  - freedesktop-sdk.bst:components/libproxy.bst
  - freedesktop-sdk.bst:components/libxkbcommon.bst
  - freedesktop-sdk.bst:components/mesa-headers.bst
  - freedesktop-sdk.bst:components/openssl.bst
  - freedesktop-sdk.bst:components/systemd-libs.bst
  - freedesktop-sdk.bst:components/zstd.bst

variables:
  qt-opts: >-
    -DBUILD_SHARED_LIBS=ON
    -DWARNINGS_ARE_ERRORS=OFF
    -DQT_CREATE_VERSIONED_HARD_LINK=OFF

  qt-auto-detect-opts: >-
    -DQT_USE_VCPKG=OFF

  # NOTE: INSTALL_PUBLICBINDIR is purposefully left empty
  qt-build-paths: >-
    -DINSTALL_BINDIR=%{qt-bindir}
    -DINSTALL_INCLUDEDIR=%{qt-includedir}
    -DINSTALL_LIBDIR=%{qt-libdir}
    -DINSTALL_MKSPECSDIR=%{qt-mkspecsdir}
    -DINSTALL_ARCHDATADIR=%{qt-archdatadir}
    -DINSTALL_PLUGINSDIR=%{qt-pluginsdir}
    -DINSTALL_LIBEXECDIR=%{qt-libexecdir}
    -DINSTALL_QMLDIR=%{qt-qmldir}
    -DINSTALL_DATADIR=%{qt-datadir}
    -DINSTALL_DOCDIR=%{qt-docdir}
    -DINSTALL_TRANSLATIONSDIR=%{qt-translationsdir}
    -DINSTALL_SYSCONFDIR=%{qt-sysconfdir}
    -DINSTALL_EXAMPLESDIR=%{qt-examplesdir}
    -DINSTALL_TESTSDIR=%{qt-testsdir}
    -DINSTALL_DESCRIPTIONSDIR=%{qt-descriptionsdir}

  qt-build-opts: >-
    -DQT_BUILD_BENCHMARKS=OFF
    -DQT_BUILD_TESTS=OFF
    -DQT_BUILD_TESTS_BY_DEFAULT=OFF
    -DQT_BUILD_TESTS_BATCHED=OFF
    -DQT_BUILD_MANUAL_TESTS=OFF
    -DQT_BUILD_MINIMAL_STATIC_TESTS=OFF
    -DQT_BUILD_MINIMAL_ANDROID_MULTI_ABI_TESTS=OFF
    -DQT_BUILD_TOOLS_BY_DEFAULT=OFF
    -DQT_BUILD_EXAMPLES=OFF
    -DQT_BUILD_EXAMPLES_BY_DEFAULT=OFF
    -DQT_INSTALL_EXAMPLES_SOURCES=OFF
    -DQT_INSTALL_EXAMPLES_SOURCES_BY_DEFAULT=OFF
    -DQT_BUILD_EXAMPLES_AS_EXTERNAL=OFF
    -DQT_USE_CCACHE=OFF
    -DQT_UNITY_BUILD=OFF
    -DQT_ALLOW_DOWNLOAD=OFF

  qt-base-opts: >-
    -DFEATURE_pkg_config=ON
    -DFEATURE_system_zlib=ON
    -DFEATURE_zstd=ON
    -DFEATURE_stdlib_libcpp=OFF
    -DFEATURE_dbus=ON
    -DFEATURE_dbus_linked=ON
    -DFEATURE_printsupport=OFF
    -DFEATURE_sql=OFF
    -DFEATURE_testlib=OFF
    -DFEATURE_openssl=ON
    -DFEATURE_openssl_linked=ON
    -DFEATURE_opensslv11=OFF
    -DFEATURE_opensslv30=ON

  qt-base-plugins-opts: >-
    -DFEATURE_libudev=ON

  # NOTE: Qt's buildsystem does not look like following compiler flags for those
  qt-base-arch-opts: >-
    -DFEATURE_x86intrin=OFF
    -DFEATURE_neon=OFF
    -DFEATURE_intelcet=OFF
  (?):
  - target_arch == "x86_64":
      # NOTE: Based on x86_64-v2
      qt-base-arch-opts: >-
        -DFEATURE_x86intrin=ON
        -DFEATURE_sse2=ON
        -DFEATURE_sse3=ON
        -DFEATURE_ssse3=ON
        -DFEATURE_sse4_1=ON
        -DFEATURE_sse4_2=ON
        -DFEATURE_avx=OFF
        -DFEATURE_f16c=OFF
        -DFEATURE_avx2=OFF
        -DFEATURE_avx512f=OFF
        -DFEATURE_avx512er=OFF
        -DFEATURE_avx512cd=OFF
        -DFEATURE_avx512pf=OFF
        -DFEATURE_avx512dq=OFF
        -DFEATURE_avx512bw=OFF
        -DFEATURE_avx512vl=OFF
        -DFEATURE_avx512ifma=OFF
        -DFEATURE_avx512vbmi=OFF
        -DFEATURE_avx512vbmi2=OFF
        -DFEATURE_aesni=OFF
        -DFEATURE_vaes=OFF
        -DFEATURE_rdrnd=OFF
        -DFEATURE_rdseed=OFF
        -DFEATURE_shani=OFF
        -DFEATURE_intelcet=ON
  - target_arch == "aarch64":
      qt-base-arch-opts: >-
        -DFEATURE_neon=ON
        -DFEATURE_arm_crc32=OFF
        -DFEATURE_arm_crypto=OFF
        -DFEATURE_intelcet=OFF

  # NOTE: double-conversion and libb2 are built-in
  qt-core-opts: >- # TODO
    -DFEATURE_doubleconversion=ON
    -DFEATURE_system_doubleconversion=OFF
    -DFEATURE_glib=ON
    -DFEATURE_system_libb2=OFF
    -DFEATURE_pcre2=ON
    -DFEATURE_system_pcre2=ON
    -DFEATURE_openssl_hash=OFF

  qt-core-tools-opts: >-
    -DFEATURE_androiddeployqt=OFF
    -DFEATURE_macdeployqt=OFF
    -DFEATURE_windeployqt=OFF
    -DFEATURE_qmake=OFF

  qt-gui-opts: >-
    -DFEATURE_accessibility=ON
    -DFEATURE_accessibility_atspi_bridge=ON
    -DFEATURE_freetype=ON
    -DFEATURE_system_freetype=ON
    -DFEATURE_fontconfig=ON
    -DFEATURE_gbm=OFF
    -DFEATURE_harfbuzz=ON
    -DFEATURE_system_harfbuzz=ON
    -DFEATURE_opengles2=OFF
    -DFEATURE_opengles3=OFF
    -DFEATURE_opengles31=OFF
    -DFEATURE_opengles32=OFF
    -DFEATURE_opengl_desktop=ON
    -DFEATURE_opengl_dynamic=OFF
    -DFEATURE_dynamicgl=OFF
    -DFEATURE_opengl=ON
    -DFEATURE_vkgen=OFF
    -DFEATURE_vulkan=OFF
    -DFEATURE_openvg=OFF
    -DFEATURE_egl=ON
    -DFEATURE_png=ON
    -DFEATURE_system_png=ON
    -DFEATURE_xkbcommon=ON
    -DFEATURE_textmarkdownreader=ON
    -DFEATURE_system_textmarkdownreader=OFF
    -DFEATURE_pdf=OFF

  qt-gui-plugins-opts: >-
    -DFEATURE_directfb=OFF
    -DFEATURE_evdev=ON
    -DFEATURE_integrityfb=OFF
    -DFEATURE_kms=OFF
    -DFEATURE_drm_atomic=OFF
    -DFEATURE_libinput=ON
    -DFEATURE_libinput_axis_api=ON
    -DFEATURE_libinput_hires_wheel_support=ON
    -DFEATURE_integrityhid=OFF
    -DFEATURE_linuxfb=OFF
    -DFEATURE_vsp2=OFF
    -DFEATURE_vnc=OFF
    -DFEATURE_mtdev=ON
    -DFEATURE_vkkhrdisplay=OFF
    -DFEATURE_egl_x11=ON
    -DFEATURE_eglfs=OFF
    -DFEATURE_eglfs_brcm=OFF
    -DFEATURE_eglfs_egldevice=OFF
    -DFEATURE_eglfs_gbm=OFF
    -DFEATURE_eglfs_vsp2=OFF
    -DFEATURE_eglfs_mali=OFF
    -DFEATURE_eglfs_viv=OFF
    -DFEATURE_eglfs_rcar=OFF
    -DFEATURE_eglfs_viv_wl=OFF
    -DFEATURE_eglfs_openwfd=OFF
    -DFEATURE_eglfs_x11=OFF
    -DFEATURE_gif=ON
    -DFEATURE_ico=ON
    -DFEATURE_jpeg=ON
    -DFEATURE_system_jpeg=ON
    -DFEATURE_tslib=OFF
    -DFEATURE_tuiotouch=OFF
    -DFEATURE_xcb=ON
    -DFEATURE_xcb_glx_plugin=ON
    -DFEATURE_xcb_egl_plugin=ON
    -DFEATURE_xcb_native_painting=OFF
    -DFEATURE_xcb_xlib=ON
    -DFEATURE_xcb_sm=ON
    -DFEATURE_system_xcb_xinput=ON
    -DFEATURE_xkbcommon_x11=ON
    -DFEATURE_xlib=ON

  qt-networks-opts: >-
    -DFEATURE_libresolv=ON
    -DFEATURE_libproxy=ON

  # NOTE: style-windows and style-stylesheet are not optional
  qt-widgets-opts: >-
    -DFEATURE_style_fusion=ON
    -DFEATURE_style_mac=OFF
    -DFEATURE_style_windows=ON
    -DFEATURE_style_windowsvista=OFF
    -DFEATURE_style_android=OFF
    -DFEATURE_style_stylesheet=ON

  qt-widgets-plugins-opts: >-
    -DFEATURE_gtk3=OFF

  cmake-local: >-
    %{qt-opts}
    %{qt-auto-detect-opts}
    %{qt-build-paths}
    %{qt-build-opts}
    %{qt-base-opts}
    %{qt-base-plugins-opts}
    %{qt-base-arch-opts}
    %{qt-core-opts}
    %{qt-core-tools-opts}
    %{qt-gui-opts}
    %{qt-gui-plugins-opts}
    %{qt-widgets-opts}
    %{qt-widgets-plugins-opts}

sources:
- kind: tar
  url:
    qt_archive:%{qt-api-version}/%{qt-version}/submodules/qtbase-everywhere-src-%{qt-version}.tar.xz
  ref: 0493fd0b380c4edf8872f011a7f26d245aa4cdd75b349904ef340a22dedf7462
