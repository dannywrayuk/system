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
					CopilotSuggestion = { fg = colors.yellow, bg = utils.blend(colors.yellow, colors.base, 0.2) },
					SnacksDashboardHeader = { fg = "#ffca1e" },
					SnacksDashboardFooter = { fg = "#ffca1e" },
					SnacksDashboardDesc = { fg = "#ffca1e" },
					SnacksDashboardSpecial = { fg = colors.red },
					SnacksDashboardFile = { fg = "#ffca1e" },
					SnacksDashboardIcon = { fg = colors.peach },
					SnacksDashboardTitle = { fg = "#ffca1e" },
					SnacksDashboardKey = { fg = colors.red },
				})
			end,
		}
	end,
}
