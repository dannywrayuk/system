return function(wezterm)
	local M = {}
	M.branch = function(cwd)
		if cwd == nil or cwd == "-" then
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

	M.toplevel = function(cwd)
		if cwd == nil or cwd == "-" then
			return "-"
		end
		local success, stdout, stderr = wezterm.run_child_process({
			"/etc/profiles/per-user/danny/bin/git",
			"-C",
			cwd,
			"rev-parse",
			"--show-toplevel",
		})

		if success then
			return string.gsub(stdout, "\n", "")
		end
		print("git: toplevel", stderr)
		return cwd
	end
	return M
end
