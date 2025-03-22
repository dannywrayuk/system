return {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = { "VeryLazy" },
	opts = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")
		local hex = require("dannywrayuk.util.hex")
		local pathToBreadcrumb = require("dannywrayuk.util.pathToBreadcrumb")
		local separator = { left = "", right = "" }

		local modeBar = function(mode_col)
			return {
				a = { fg = colors.mantle, bg = mode_col },
				c = { fg = colors.subtext2, bg = hex.blend(mode_col, colors.base, 0.1) },
				y = { fg = colors.text, bg = hex.blend(mode_col, colors.mantle, 0.2) },
				z = { fg = colors.text, bg = hex.blend(mode_col, colors.mantle, 0.3) },
			}
		end

		local cwd = {
			function()
				return pathToBreadcrumb(vim.fn.fnamemodify(vim.fn.getcwd(), ":~"))
			end,
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
			separator = separator,
		}

		return {
			options = {
				theme = {
					normal = modeBar(colors.blue),
					insert = modeBar(colors.green),
					visual = modeBar(colors.yellow),
					replace = modeBar(colors.red),
					command = modeBar(colors.mauve),
					terminal = modeBar(colors.mauve),
					inactive = {
						a = { fg = colors.text, bg = colors.surface0 },
						b = { fg = colors.text, bg = "#00000000" },
					},
				},
				component_separators = "|",
				-- for some reason they are reversed here
				section_separators = { left = separator.right, right = separator.left },
				disabled_filetypes = { statusline = { "snacks_dashboard" } },
				globalstatus = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = {},
				lualine_c = { { "filename", path = 1, fmt = pathToBreadcrumb } },
				lualine_x = {},
				lualine_y = { "diagnostics", "diff" },
				lualine_z = { { "filetype", separator = separator } },
			},
			inactive_sections = {},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				{
					filetypes = { "neo-tree" },
					sections = {
						lualine_a = { mode },
						lualine_c = { cwd },
						lualine_z = { { "filetype", separator = separator } },
					},
				},
				{
					filetypes = { "NeogitStatus", "TelescopePrompt", "snacks_input" },
					sections = {
						lualine_a = { mode },
						lualine_c = {},
						lualine_z = { { "filetype", separator = separator } },
					},
				},
			},
		}
	end,
}
