return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local colors = {
			blue = "#8cbeef",
			green = "#84c33c",
			yellow = "#eac282",
			red = "#d57465",

			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			violet = "#d183e8",
			grey = "#303030",
			none = "#00000000",
		}

		local separators = {
			component = {
				arrow = {
					left = "",
					right = "",
				},
				line = "|",
			},
			section = {
				arrow = {
					left = "",
					right = "",
				},
				round = {
					left = "",
					right = "",
				},
			},
		}

		local theme = {
			normal = {
				a = { fg = colors.black, bg = colors.blue },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = colors.none },
			},

			insert = { a = { fg = colors.black, bg = colors.green } },
			visual = { a = { fg = colors.black, bg = colors.yellow } },
			replace = { a = { fg = colors.black, bg = colors.red } },

			inactive = {
				a = { fg = colors.white, bg = colors.grey },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white, bg = colors.none },
			},
		}

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = separators.component.line,
				section_separators = separators.section.round,
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { { "filename", path = 1 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "neo-tree" },
		})
	end,
}
