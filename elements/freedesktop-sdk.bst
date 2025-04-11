kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/24.08
  track-tags: True
  ref: freedesktop-sdk-24.08.17-0-g3fdd23052bf2bd22ff6928b307faa2672cae994e
- kind: create_custom_fdo_sdk_include_ffmpeg

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'
