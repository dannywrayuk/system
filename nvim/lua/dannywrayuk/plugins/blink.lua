return {
	{
		"saghen/blink.cmp",
		-- dependencies = {
		-- 	"rafamadriz/friendly-snippets",
		-- },
		lazy = true,
		version = "v0.14.0",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 1500,
				},
			},

			keymap = {
				preset = "none",
				["<Left>"] = { "hide", "fallback" },
				["<Right>"] = { "accept", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<S-Left>"] = { "snippet_forward", "fallback" },
			},
		},
	},
}
