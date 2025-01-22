kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/23.08
  track-tags: True
  ref: freedesktop-sdk-23.08.27-0-g1f8958b9d76635b3e5e60157d9f557dee1b7516e
- kind: create_custom_fdo_sdk_include_ffmpeg

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'
