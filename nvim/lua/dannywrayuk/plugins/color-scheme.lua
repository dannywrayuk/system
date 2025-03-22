return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = true,
		opts = function()
			local readFile = require("dannywrayuk.util.readFile")
			local hex = require("dannywrayuk.util.hex")
			local palette = vim.json.decode(readFile(vim.fn.expand("$HOME/.config/system/colors/palette.json")))
			return {
				color_overrides = {
					all = palette,
				},
				custom_highlights = function(colors)
					return {
						SpelunkerSpellBad = { bg = hex.blend(colors.red, colors.base, 0.2) },
						SpelunkerComplexOrCompoundWord = { bg = hex.blend(colors.red, colors.base, 0.2) },
						NeoTreeNormal = { bg = colors.base },
						NeoTreeNormalNC = { bg = colors.base },
						NeoTreeFloatNormal = { bg = colors.base },
						NeoTreeFloatBorder = { bg = colors.base, fg = colors.blue },
						NeoTreeFloatTitle = { bg = colors.base, fg = colors.blue },
						NeoTreeGitUntracked = { link = "NeoTreeGitAdded" },
						WinSeparator = { fg = colors.blue },
						NormalFloat = { bg = colors.surface0 },
						CopilotSuggestion = { fg = colors.yellow, bg = hex.blend(colors.yellow, colors.base, 0.2) },
						Number = { fg = colors.mauve },
						Delimiter = { fg = colors.blue },
						Conditional = { link = "Keyword" },
						["@punctuation"] = { fg = colors.red },
						["@punctuation.bracket"] = { fg = colors.red },
						["@parameter"] = { fg = colors.peach },
						["@module"] = { fg = colors.peach },
						["@variable"] = { fg = colors.yellow },
						["@variable.member"] = { fg = colors.maroon },
						["@property"] = { fg = colors.maroon },
						["@function.builtin"] = { fg = colors.sapphire },
						["Type"] = { fg = colors.teal },
						["@type.builtin"] = { fg = colors.pink },
						["@constant.builtin"] = { fg = colors.pink },
						["Operator"] = { fg = colors.blue },
						["@string.documentation"] = { fg = colors.blue },
					}
				end,
			}
		end,
	},
}
