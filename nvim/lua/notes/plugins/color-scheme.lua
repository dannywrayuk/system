return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = true,
	opts = function()
		local utils = require("core.utils")
		local palette = vim.json.decode(utils.readFile(vim.fn.expand("$HOME/.config/system/colors/palette.json")))
		return {
			color_overrides = {
				all = palette,
			},
			custom_highlights = function(colors)
				return vim.tbl_deep_extend("force", require("core.colors")(colors), {
					SnacksDashboardHeader = { fg = colors.mauve },
					SnacksDashboardFooter = { fg = colors.mauve },
					SnacksDashboardDesc = { fg = colors.mauve },
					SnacksDashboardSpecial = { fg = colors.sky },
					SnacksDashboardFile = { fg = colors.mauve },
					SnacksDashboardIcon = { fg = colors.blue },
					SnacksDashboardTitle = { fg = colors.mauve },
					SnacksDashboardKey = { fg = colors.sky },
				})
			end,
		}
	end,
}
