return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local readFile = require("dannywrayuk.util.readFile")
			local palette = vim.json.decode(readFile(vim.fn.expand("$HOME/.config/system/colors/palette.json")))
			require("catppuccin").setup({
				color_overrides = {
					all = palette,
				},
				custom_highlights = function(colors)
					return {
						-- Comment = { fg = colors.flamingo },
					}
				end,
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
