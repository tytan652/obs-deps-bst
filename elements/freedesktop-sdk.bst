kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/24.08
  track-tags: True
  ref: freedesktop-sdk-24.08.20-0-g06b1aa6a3dce92f31ca1cc7245b8660397c46a42
- kind: create_custom_fdo_sdk_include_ffmpeg

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'
