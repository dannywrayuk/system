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

-- config.hide_tab_bar_if_only_one_tab = true
config.send_composed_key_when_left_alt_is_pressed = true
config.use_dead_keys = false

-- Bug fix until issue is resolved
-- https://github.com/wez/wezterm/issues/5990
config.front_end = "WebGpu"

local act = wezterm.action

config.keys = {
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = act.SwitchToWorkspace({
			name = "test2",
		}),
	},
	{
		key = "9",
		mods = "ALT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

local getCwd = function(pane)
	local paneCwd = pane:get_current_working_dir()
	if paneCwd then
		local filePath = paneCwd.file_path
		if filePath then
			return filePath
		end
	end
	return "-"
end

local getGitBranch = function(cwd)
	if cwd == "-" then
		return "-"
	end
	local success, stdout, stderr = wezterm.run_child_process({
		"/etc/profiles/per-user/danny/bin/git",
		"-C",
		cwd,
		"branch",
		"--show-current",
	})
	if success then
		return string.gsub(stdout, "\n", "")
	end
	print("git: branch", stderr)
	return "-"
end

local split = function(s, delimiter)
	local result = {}
	for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match)
	end
	return result
end

local getBasepath = function(str)
	local pathSplit = split(str, "/")
	return pathSplit[#pathSplit]
end

local makeFancyCwd = function(cwd, gitBranch)
	if gitBranch == "-" then
		return getBasepath(cwd)
	end
	local success, stdout, stderr = wezterm.run_child_process({
		"/etc/profiles/per-user/danny/bin/git",
		"-C",
		cwd,
		"rev-parse",
		"--show-toplevel",
	})

	if success then
		return string.gsub(getBasepath(stdout), "\n", "")
	end
	print("git: rev-parse", stderr)
	return cwd
end

local pill = function(fg, bg, icon, text, base)
	return wezterm.format({
		{ Foreground = { Color = fg } },
		{ Text = "" },
		{ Foreground = { Color = bg } },
		{ Background = { Color = fg } },
		{ Text = icon .. " " },
		{ Foreground = { Color = fg } },
		{ Background = { Color = bg } },
		{ Text = " " .. text },
		{ Foreground = { Color = bg } },
		{ Background = { Color = base } },
		{ Text = "" },
	})
end

local solidPill = function(fg, bg, icon, text, base)
	return wezterm.format({
		{ Foreground = { Color = fg } },
		{ Text = "" },
		{ Foreground = { Color = bg } },
		{ Background = { Color = fg } },
		{ Text = icon .. " " .. text },
		{ Foreground = { Color = fg } },
		{ Background = { Color = base } },
		{ Text = "" },
	})
end

wezterm.on("update-status", function(gui_window, pane)
	local palette = gui_window:effective_config().resolved_palette
	local tab_count = #gui_window:mux_window():tabs()
	local tab_width = gui_window:active_tab():get_size().cols
	local max_left = tab_width / 2 - (tab_count * 4 - 1) / 2
	local date = wezterm.strftime("%A, %d %b  %H:%M:%S")
	local cwd = getCwd(pane)
	local gitBranch = getGitBranch(cwd)
	local fancyCwd = makeFancyCwd(cwd, gitBranch)
	local battery = wezterm.battery_info()[1]
	local batteryPercentage = string.format("%.0f%%", battery.state_of_charge * 100)
	local lstatus = pill(
		palette.brights[5],
		palette.tab_bar.new_tab.bg_color,
		"",
		fancyCwd,
		palette.tab_bar.background
	) .. " " .. solidPill(
		palette.brights[7],
		palette.tab_bar.new_tab.bg_color,
		"",
		gitBranch,
		palette.tab_bar.background
	)
	local rstatus = (
		battery.state == "Charging"
			and solidPill(
				palette.brights[3],
				palette.tab_bar.new_tab.bg_color,
				"",
				batteryPercentage,
				palette.tab_bar.background
			)
		or pill(
			palette.brights[4],
			palette.tab_bar.new_tab.bg_color,
			"",
			batteryPercentage,
			palette.tab_bar.background
		)
	)
		.. " "
		.. pill(palette.brights[6], palette.tab_bar.new_tab.bg_color, "󰃭", date, palette.tab_bar.background)
	local contentLength = #gitBranch + 4 + #fancyCwd + 5 + 1

	gui_window:set_left_status(lstatus .. wezterm.pad_left(" ", max_left - contentLength))
	gui_window:set_right_status(rstatus)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, local_config, hover, max_width)
	local palette = local_config.resolved_palette
	local base = palette.tab_bar.background
	local tabColor = tab.is_active and palette.tab_bar.active_tab or palette.tab_bar.inactive_tab
	return {
		{ Background = { Color = base } },
		{ Foreground = { Color = tabColor.bg_color } },
		{ Text = "" },
		{ Background = { Color = tabColor.bg_color } },
		{ Foreground = { Color = tabColor.fg_color } },
		{ Attribute = { Intensity = "Bold" } },
		{ Text = tostring(tab.tab_index + 1) },
		{ Background = { Color = base } },
		{ Foreground = { Color = tabColor.bg_color } },
		{ Text = " " },
	}
end)

return config
