kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  # Update include/strip.yml, elements/include/ffmpeg.yml and elements/plugins if bumping Freedesktop SDK release branch
  track: release/25.08
  track-tags: True
  ref: freedesktop-sdk-25.08.0-0-g04d50e865e92fcc115136b0bc882c17a3d36a1dd

config:
  options:
    target_arch: '%{target_arch}'
    bootstrap_build_arch: '%{target_arch}'
