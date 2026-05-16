local c = require("core.pickers")
local n = require("notes.pickers")

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
				toggle_preview = c.toggle_preview,
				explorer_up = c.explorer_up,
				explorer_focus = c.explorer_focus,
			},
			layouts = {
				dannywrayuk = c.layout,
			},
		},
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
	},
	keys = {
		{ "<leader>fn", n.daily, desc = "List Daily Notes" },
		{ "<leader>ft", n.newTemplate, desc = "New note from template" },
		{ "<leader>fg", n.tags, desc = "Find Tags" },
		{ "<leader>fb", n.backlinks, desc = "Find Backlinks" },
		{ "<leader>t", c.explorer, desc = "File Explorer" },
		{ "<leader>ff", c.smart, desc = "Smart Find Files" },
		{ "<leader>fr", c.recent, desc = "Recent" },
		{ "<leader>fl", c.lines, desc = "Buffer Lines" },
		{ "<leader>fo", c.lines_word, desc = "Buffer Word Occurrences" },
		{ "<leader>fs", c.grep, desc = "Grep" },
		{ "<leader>fw", c.grep_word, desc = "Visual selection or word", mode = { "n", "x" } },
		{ "<leader>f;", c.resume, desc = "Resume" },
		{ "zs", c.spelling, desc = "Spell Suggestions" },
		{ "<leader>f.", c.pickers, desc = "All Pickers" },
	},
}
