kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/24.08
  track-tags: True
  ref: freedesktop-sdk-24.08.21-0-g8ff2392c4772fa16a9f5aafdc92d0b5196f372a9
- kind: create_custom_fdo_sdk_include_ffmpeg

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'
