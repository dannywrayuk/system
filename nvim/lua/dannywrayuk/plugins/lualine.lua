return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local colors = require("catppuccin.palettes").get_palette("mocha")
		local hex = require("dannywrayuk.util.hex")

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
		local modeBar = function(mode_col)
			return {
				a = { fg = colors.mantle, bg = mode_col },
				c = { fg = colors.text, bg = hex.blend(mode_col, colors.base, 0.1) },
				z = { fg = colors.test, bg = colors.surface0 },
			}
		end
		local theme = {
			normal = modeBar(colors.blue),
			insert = modeBar(colors.green),
			visual = modeBar(colors.yellow),
			replace = modeBar(colors.red),
			command = modeBar(colors.mauve),
			terminal = modeBar(colors.mauve),
			inactive = {
				a = { fg = colors.text, bg = colors.surface0 },
				b = { fg = colors.text, bg = none },
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
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "diagnostics", "diff" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
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
