local p = require("core.pickers")
return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			enable = true,
			layout = { preset = "dannywrayuk" },
			sources = {
				select = { layout = { preset = "select" } },
				explorer = { layout = { preset = "dannywrayuk" } },
				spelling = { layout = { preset = "dannywrayuk" } },
				git_branches = { layout = { preset = "dannywrayuk" } },
			},
			actions = {
				toggle_preview = p.toggle_preview,
				explorer_up = p.explorer_up,
				explorer_focus = p.explorer_focus,
			},
			layouts = {
				dannywrayuk = p.layout,
			},
			win = {
				list = {
					keys = {
						["s"] = { "edit_vsplit", desc = "Open in split", mode = { "n" } },
					},
				},
			},
		},
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
	},
	keys = {
		{ "<leader>t", p.explorer, desc = "File Explorer" },
		{ "<leader>ff", p.smart, desc = "Smart Find Files" },
		{ "<leader>fn", p.directory, desc = "Find Directory" },
		{ "<leader>fr", p.recent, desc = "Recent" },
		{ "<leader>fg", p.git_branches, desc = "Git Branches" },
		{ "<leader>fl", p.lines, desc = "Buffer Lines" },
		{ "<leader>fo", p.lines_word, desc = "Buffer Word Occurrences" },
		{ "<leader>fs", p.grep, desc = "Grep" },
		{ "<leader>fw", p.grep_word, desc = "Visual selection or word", mode = { "n", "x" } },
		{ "<leader>fD", p.diagnostics, desc = "Diagnostics" },
		{ "<leader>fd", p.diagnostics_buffer, desc = "Buffer Diagnostics" },
		{ "<leader>fh", p.help, desc = "Help Pages" },
		{ "<leader>f;", p.resume, desc = "Resume" },
		{ "zs", p.spelling, desc = "Spell Suggestions" },
		{ "<leader>f.", p.pickers, desc = "All Pickers" },
	},
}
