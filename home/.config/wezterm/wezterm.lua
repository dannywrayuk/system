-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 20
config.window_padding = {
	left = 0,
	right = 0,
	top = 10,
	bottom = 10,
}

config.hide_tab_bar_if_only_one_tab = true
config.send_composed_key_when_left_alt_is_pressed = true
config.use_dead_keys = false

return config
