return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local colors = require("catppuccin.palettes").get_palette("mocha")

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

		local none = "#00000000"
		local theme = {
			normal = {
				a = { fg = colors.mantle, bg = colors.blue },
				b = { fg = colors.text, bg = colors.surface0 },
				c = { fg = colors.text, bg = none },
			},
			insert = { a = { fg = colors.mantle, bg = colors.green } },
			visual = { a = { fg = colors.mantle, bg = colors.yellow } },
			replace = { a = { fg = colors.mantle, bg = colors.red } },
			command = { a = { fg = colors.mantle, bg = colors.mauve } },
			terminal = { a = { fg = colors.mantle, bg = colors.mauve } },
			inactive = {
				a = { fg = colors.text, bg = colors.surface0 },
				b = { fg = colors.text, bg = colors.mantle },
				c = { fg = colors.text, bg = none },
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
