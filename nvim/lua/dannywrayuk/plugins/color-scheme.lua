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
						NeoTreeNormal = { bg = colors.base },
						NeoTreeNormalNC = { bg = colors.base },
					}
				end,
			})
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		local hex = require("dannywrayuk.util.hex")
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			on_highlights = function(hl, c)
	-- 				local spellBadBg = hex.blend(c.red, c.bg_dark, 0.2)
	-- 				hl.SpelunkerSpellBad = {
	-- 					bg = spellBadBg,
	-- 				}
	-- 				hl.SpelunkerComplexOrCompoundWord = {
	-- 					bg = spellBadBg,
	-- 				}
	-- 			end,
	-- 		})
	-- 		vim.cmd([[colorscheme tokyonight]])
	-- 	end,
	-- },
}
