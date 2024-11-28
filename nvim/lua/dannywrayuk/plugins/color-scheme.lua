return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local readFile = require("dannywrayuk.util.readFile")
			local hex = require("dannywrayuk.util.hex")
			local palette = vim.json.decode(readFile(vim.fn.expand("$HOME/.config/system/colors/palette.json")))
			require("catppuccin").setup({
				color_overrides = {
					all = palette,
				},
				custom_highlights = function(colors)
					return {
						SpelunkerSpellBad = { bg = hex.blend(colors.red, colors.base, 0.2) },
						SpelunkerComplexOrCompoundWord = { bg = hex.blend(colors.red, colors.base, 0.2) },
					}
				end,
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
