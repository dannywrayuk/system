local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.colors = require("color")
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 20
config.window_padding = {
	left = 0,
	right = 0,
	top = 10,
	bottom = 10,
}

config.send_composed_key_when_left_alt_is_pressed = true
config.use_dead_keys = false

-- Bug fix until issue is resolved
-- https://github.com/wez/wezterm/issues/5990
config.front_end = "WebGpu"

local act = wezterm.action
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
				act.SplitPane({
					direction = "Left",
					command = {
						args = { "zsh", "-c", "sessionizer" },
					},
					size = {
						Cells = 35,
					},
				}),
				act.PopKeyTable,
			}),
		},
		{
			key = "c",
			action = act.Multiple({
				act.SplitPane({
					direction = "Right",
					command = {
						args = { "zsh", "-c", "git-add-commit-push" },
					},
					size = {
						Cells = 35,
					},
				}),
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
