local wezterm = require("wezterm")
local readFile = require("readFile")
return wezterm.json_parse(readFile(wezterm.home_dir .. "/.config/system/colors/palette.json"))
