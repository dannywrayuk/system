return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		indent = {
			enabled = true,
			animate = { enabled = false },
			hl = "Comment",
			scope = { hl = "Normal" },
		},
		gitbrowse = {
			enabled = true,
		},
		input = {
			enabled = true,
		},
		quickfile = {
			enabled = true,
		},
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "recent_files", cwd = true, padding = 2 },
				{ section = "keys", padding = 2, gap = 1 },
				{ section = "startup" },
			},
			preset = {
				keys = {
					{
						icon = "",
						key = "b",
						desc = "Branches",
						action = ":lua Snacks.dashboard.pick('git_branches')",
					},
					{ icon = "", key = "p", desc = "Pull", action = ":!git pull" },
					{
						icon = "",
						key = "m",
						desc = "Checkout main",
						action = ":silent !git checkout $(git rev-parse --abbrev-ref origin/HEAD | cut -c8-)",
					},
					{ icon = "", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
