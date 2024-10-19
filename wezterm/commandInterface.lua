return function(wezterm, commands)
	wezterm.on("user-var-changed", function(window, pane, name, value)
		wezterm.log_info("[User Var Command]", name, value)
		local args = wezterm.json_parse(value)
		if commands[name] == nil then
			wezterm.log_info("[User Var Command] Not Found", name, args)
			return
		end
		window:perform_action(commands[name](args, window, pane), pane)
	end)
end
