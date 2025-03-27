local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.colors = require("color")
config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 1,
}
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.window_decorations = "RESIZE"
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = 0,
	bottom = 0,
}

local act = wezterm.action
local fontOption = 1
local fontSizes = { 18, 28, 10 }

local changeFontAction = wezterm.action_callback(function(window, pane)
	local overrides = window:get_config_overrides() or {}
	fontOption = (fontOption % #fontSizes) + 1
	overrides.font_size = fontSizes[fontOption]
	window:set_config_overrides(overrides)
end)

config.font_size = fontSizes[fontOption]
config.default_workspace = "Scratch"
config.keys = {
	{
		key = "a",
		mods = "CTRL",
		action = act.ActivateKeyTable({
			name = "LEADER",
			timeout_milliseconds = 2000,
			one_shot = true,
		}),
	},
}
config.key_tables = {
	LEADER = {
		{
			key = "a",
			action = act.Multiple({
				wezterm.action_callback(function(window, pane)
					window:perform_action(
						act.SplitPane({
							direction = "Down",
							command = {
								args = { "zsh", "-c", "sessionizer" },
							},
							size = {
								Cells = 20,
							},
						}),
						pane
					)
				end),
				act.PopKeyTable,
			}),
		},
		{
			key = "c",
			action = act.Multiple({
				wezterm.action_callback(function(window, pane)
					window:perform_action(
						act.SplitPane({
							direction = "Down",
							command = {
								args = { "zsh", "-c", "git-add-commit-push" },
							},
							size = {
								Cells = 20,
							},
						}),
						pane
					)
				end),
				act.PopKeyTable,
			}),
		},
		{
			key = "i",
			action = act.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
		{
			key = "d",
			action = act.SwitchToWorkspace({ name = "Scratch" }),
		},
		{
			key = "s",
			action = act.SplitHorizontal({
				domain = "CurrentPaneDomain",
			}),
		},
		{
			key = "n",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "x",
			action = act.CloseCurrentTab({ confirm = false }),
		},
		{
			key = "o",
			action = act.ActivateLastTab,
		},
		{
			key = "w",
			action = act.ActivatePaneDirection("Next"),
		},
		{
			key = "z",
			action = act.TogglePaneZoomState,
		},
		{
			key = "f",
			action = changeFontAction,
		},
	},
}
for i = 1, 9 do
	table.insert(config.key_tables.LEADER, {
		key = tostring(i),
		action = act.ActivateTab(i - 1),
	})
end

require("commandInterface")(wezterm, {
	switchToWorkspace = function(args)
		return act.SwitchToWorkspace({
			name = args.name or "default",
			spawn = {
				cwd = args.cwd or wezterm.home_dir,
			},
		})
	end,
})

wezterm.on("format-window-title", function(tab)
	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "🔍 "
	end

	return zoomed .. wezterm.mux.get_active_workspace()
end)

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

require("tabbar")(wezterm)

return config
