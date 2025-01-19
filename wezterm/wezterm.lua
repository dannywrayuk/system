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
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.send_composed_key_when_left_alt_is_pressed = true
config.use_dead_keys = false

-- Bug fix until issue is resolved
-- https://github.com/wez/wezterm/issues/5990
config.front_end = "WebGpu"

local act = wezterm.action
local fontOption = 1
local fontSizes = { 15, 20, 24 }

local centerInWindow = false
local paddedWindowWidth = 100

config.font_size = fontSizes[fontOption]
config.default_workspace = "Scratch"
config.keys = {
	{
		key = "a",
		mods = "CTRL",
		action = act.ActivateKeyTable({
			name = "LEADER",
			timeout_milliseconds = 1000,
			one_shot = false,
			until_unknown = true,
		}),
	},
}
config.key_tables = {
	LEADER = {
		{
			key = "a",
			action = act.Multiple({
				wezterm.action_callback(function(window, pane)
					local direction = centerInWindow and "Down" or "Left"
					local cells = centerInWindow and 10 or 50
					window:perform_action(
						act.SplitPane({
							direction = direction,
							command = {
								args = { "zsh", "-c", "sessionizer" },
							},
							size = {
								Cells = cells,
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
					local direction = centerInWindow and "Down" or "Right"
					local cells = centerInWindow and 20 or 50
					window:perform_action(
						act.SplitPane({
							direction = direction,
							command = {
								args = { "zsh", "-c", "git-add-commit-push" },
							},
							size = {
								Cells = cells,
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
			key = "t",
			action = act.ActivatePaneDirection("Next"),
		},
		{
			key = "z",
			action = act.TogglePaneZoomState,
		},
		{
			key = "f",
			action = wezterm.action_callback(function(window, pane)
				local overrides = window:get_config_overrides() or {}
				fontOption = (fontOption % #fontSizes) + 1
				overrides.font_size = fontSizes[fontOption]
				window:set_config_overrides(overrides)
			end),
		},
		{
			key = "k",
			action = wezterm.action_callback(function(window, pane)
				centerInWindow = not centerInWindow
				local overrides = window:get_config_overrides() or {}
				if not overrides.window_padding then
					overrides.window_padding = wezterm.window_padding
				end
				if centerInWindow then
					local windowWidth = window:active_tab():get_size().cols
					local paddingSize = tostring((windowWidth - paddedWindowWidth) / 2) .. "cell"

					overrides.window_padding.left = paddingSize
					overrides.window_padding.right = paddingSize
				else
					overrides.window_padding.left = 0
					overrides.window_padding.right = 0
				end
				window:set_config_overrides(overrides)
			end),
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
