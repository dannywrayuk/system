return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		gitbrowse = {
			enabled = true,
			branch = vim.fn.trim(vim.fn.system("git main-branch")),
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
