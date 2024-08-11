kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/23.08
  track-tags: True
  ref: freedesktop-sdk-23.08.21-0-gb74caa1b214da1f15cc278327d7806ebcae726a2
- kind: create_custom_fdo_sdk_include_ffmpeg

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'
