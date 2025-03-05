kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/24.08
  track-tags: True
  ref: freedesktop-sdk-24.08.14-0-g4800a570a8bf10ffc318ca5c119268fcf7b85d73
- kind: create_custom_fdo_sdk_include_ffmpeg

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'
