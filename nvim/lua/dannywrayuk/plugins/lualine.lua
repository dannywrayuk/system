return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local colors = require("catppuccin.palettes").get_palette("mocha")
		local hex = require("dannywrayuk.util.hex")
		local pathToBreadcrumb = require("dannywrayuk.util.pathToBreadcrumb")

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
				c = { fg = colors.subtext2, bg = hex.blend(mode_col, colors.base, 0.1) },
				y = { fg = colors.text, bg = hex.blend(mode_col, colors.mantle, 0.2) },
				z = { fg = colors.text, bg = hex.blend(mode_col, colors.mantle, 0.3) },
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
			separator = {
				right = "",
				left = "",
			},
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
				lualine_c = { { "filename", path = 1, fmt = pathToBreadcrumb } },
				lualine_x = {},
				lualine_y = {
					"diagnostics",
					"diff",
				},
				lualine_z = {
					{
						"filetype",
						separator = {
							right = "",
							left = "",
						},
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
						fmt = pathToBreadcrumb,
						separator = {
							right = "",
							left = "",
						},
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				{
					sections = {
						lualine_a = { mode },
						lualine_c = {
							{
								function()
									return pathToBreadcrumb(vim.fn.fnamemodify(vim.fn.getcwd(), ":~"))
								end,
							},
						},
						lualine_z = {
							{
								"filetype",
								separator = {
									right = "",
									left = "",
								},
							},
						},
					},
					filetypes = { "neo-tree" },
				},
				{
					sections = {
						lualine_a = { mode },
						lualine_c = {},
						lualine_z = {
							{
								"filetype",
								separator = {
									right = "",
									left = "",
								},
							},
						},
					},
					filetypes = { "NeogitStatus", "TelescopePrompt", "snacks_input" },
				},
			},
		})
	end,
}
