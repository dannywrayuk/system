return function(wezterm)
	local presentation = require("tabbar.presentation")
	local battery = require("tabbar.battery")
	local paths = require("tabbar.paths")
	local git = require("tabbar.git")(wezterm)

	wezterm.on("update-status", function(gui_window, pane)
		local tab_count = #gui_window:mux_window():tabs()
		local tab_width = gui_window:active_tab():get_size().cols
		local max_left = tab_width / 2 - (tab_count * 4 - 1) / 2

		local palette = gui_window:effective_config().resolved_palette
		local pills = presentation.pill_builder(
			palette.tab_bar.background,
			palette.tab_bar.new_tab.bg_color,
			"",
			"",
			wezterm.format
		)

		local date = wezterm.strftime("%A, %d %b  %H:%M")
		local datePill = pills.pill_label("󰃭", date, palette.tab_bar.active_tab.bg_color)

		local cwd = paths.cwd(pane)
		local gitToplevel = paths.basepath(git.toplevel(cwd))
		local projectPill = pills.pill_label("", gitToplevel, palette.brights[5])

		local gitBranch = git.branch(cwd)
		local gitBranchPill = pills.pill(" " .. gitBranch, palette.brights[7])

		local batteryPill = battery.pill(wezterm.battery_info()[1], pills, palette)

		local lstatus = table.concat({ projectPill.content, gitBranchPill.content }, " ")
		local rstatus = table.concat({ batteryPill.content, datePill.content }, " ")

		local contentLength = gitBranchPill.length + projectPill.length + 1
		local padding = #gui_window:mux_window():tabs() == 1 and "" or wezterm.pad_left(" ", max_left - contentLength)

		gui_window:set_left_status(lstatus .. padding)
		gui_window:set_right_status(rstatus)
	end)

	wezterm.on("format-tab-title", function(tab, tabs, panes, local_config, hover, max_width)
		if #tabs == 1 then
			return ""
		end
		local palette = local_config.resolved_palette
		local pills =
			presentation.pill_builder(palette.tab_bar.background, palette.tab_bar.new_tab.bg_color, "", " ")
		return pills.pill(tostring(tab.tab_index + 1), tab.is_active and palette.indexed[16] or palette.brights[5]).content
	end)
end
