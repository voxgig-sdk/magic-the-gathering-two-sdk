package = "voxgig-sdk-magic-the-gathering-two"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/magic-the-gathering-two-sdk.git"
}
description = {
  summary = "MagicTheGatheringTwo SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["magic-the-gathering-two_sdk"] = "magic-the-gathering-two_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
