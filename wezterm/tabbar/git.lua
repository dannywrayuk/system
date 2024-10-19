return function(wezterm)
	local M = {}
	local gitPath = "/etc/profiles/per-user/" .. os.getenv("USER") .. "/bin/git"

	M.branch = function(cwd)
		if cwd == nil or cwd == "-" then
			return "-"
		end
		local success, stdout, stderr = wezterm.run_child_process({
			gitPath,
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
			gitPath,
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
