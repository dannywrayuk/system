return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		gitbrowse = {
			enabled = true,
		},
		indent = {
			enabled = true,
			animate = { enabled = false },
			hl = "Comment",
		},
		input = { enabled = true },
		quickfile = { enabled = true },
	},
}
