return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local colors = {
			blue = "#89b4fa",
			green = "#a6e3a1",
			yellow = "#f9e2af",
			red = "#f38ba8",

			cyan = "#94e2d5",
			black = "#1e1e2e",
			white = "#cdd6f4",
			violet = "#cba6f7",
			grey = "#313244",
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
			command = { a = { fg = colors.black, bg = colors.violet } },
			terminal = { a = { fg = colors.black, bg = colors.violet } },
			inactive = {
				a = { fg = colors.white, bg = colors.grey },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white, bg = colors.none },
			},
		}

		local mode = {
			"mode",
			fmt = function(mode)
				local modeIcons = {
					NORMAL = "",
					INSERT = "",
					VISUAL = "󰈈",
					["V-BLOCK"] = "",
					["V-LINE"] = "",
					REPLACE = "",
					COMMAND = "",
					TERMINAL = "󱕷",
				}
				local icon = modeIcons[mode]
				if icon == nil then
					return mode:sub(1, 1)
				end
				return icon
			end,
		}

		lualine.setup({
			options = {
				theme = theme,
				component_separators = separators.component.line,
				section_separators = separators.section.round,
				disabled_filetypes = { statusline = { "alpha" } },
				globalstatus = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {},
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
			extensions = { "neo-tree", "fugitive" },
		})
	end,
}
