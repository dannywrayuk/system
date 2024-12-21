return function(wezterm)
	local palette = require("palette")
	local presentation = require("tabbar.presentation")
	local battery = require("tabbar.battery")
	local paths = require("tabbar.paths")
	local git = require("tabbar.git")(wezterm)

	local isZoomedPane = function(pane)
		if pane == nil then
			return false
		end
		local tab = pane:tab()
		if tab == nil then
			return false
		end
		local panes = tab:panes_with_info()
		if panes == nil then
			return false
		end

		for _, p in ipairs(panes) do
			if p.is_zoomed then
				return true
			end
		end
		return false
	end

	wezterm.on("update-status", function(gui_window, pane)
		local tab_count = #gui_window:mux_window():tabs()
		local tab_width = gui_window:active_tab():get_size().cols
		local max_left = tab_width / 2 - (tab_count * 4 - 1) / 2

		local pills = presentation.pill_builder(palette.base, palette.surface0, "", "", wezterm.format)

		local date = wezterm.strftime("%A, %d %b  %H:%M")
		local datePill = pills.pill_label("󰃭", date, palette.mauve)

		local cwd = paths.cwd(pane)
		local gitToplevel = paths.basepath(git.toplevel(cwd))
		local projectPill = pills.pill_label("", gitToplevel, palette.blue)

		local gitBranch = git.branch(cwd)
		local gitBranchPill = pills.pill(" " .. gitBranch, palette.teal)

		local batteryPill = battery.pill(wezterm.battery_info()[1], pills, palette)

		local is_zoomed = isZoomedPane(pane)
		local zoomPill = is_zoomed and pills.pill("", palette.surface2) or { content = "" }

		local lstatus = table.concat({
			projectPill.content,
			gitBranchPill.content,
		}, " ")

		local rstatus = table.concat({
			zoomPill.content,
			batteryPill.content,
			datePill.content,
		}, " ")

		local contentLength = gitBranchPill.length + projectPill.length + 1
		local padding = #gui_window:mux_window():tabs() == 1 and "" or wezterm.pad_left(" ", max_left - contentLength)

		-- Set top padding
		local paneDimensions = gui_window:active_tab():get_size()
		local cellHeight = math.floor(paneDimensions.pixel_height / paneDimensions.rows)
		local paddingNeeded = (
			(gui_window:get_dimensions().pixel_height - cellHeight * (paneDimensions.rows + 1) - 1) % cellHeight
		) + 1
		local overrides = gui_window:get_config_overrides() or {}
		if not overrides.window_padding then
			overrides.window_padding = wezterm.window_padding or {}
		end
		overrides.window_padding.bottom = "0px"
		overrides.window_padding.top = tostring(paddingNeeded) .. "px"
		overrides.window_padding.left = overrides.window_padding.left or 0
		overrides.window_padding.right = overrides.window_padding.right or 0
		gui_window:set_config_overrides(overrides)

		gui_window:set_left_status(lstatus .. padding)
		gui_window:set_right_status(rstatus)
	end)

	wezterm.on("format-tab-title", function(tab, tabs, panes, local_config, hover, max_width)
		if #tabs == 1 then
			return ""
		end
		local pills = presentation.pill_builder(palette.base, palette.base, "", " ")
		return pills.pill(tostring(tab.tab_index + 1), tab.is_active and palette.peach or palette.blue).content
	end)
end
