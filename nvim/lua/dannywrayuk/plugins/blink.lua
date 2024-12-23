return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.8.0",
		opts = {
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
			completion = { documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			} },
			keymap = {
				preset = "none",
				["<Left>"] = { "hide", "fallback" },
				["<Right>"] = { "accept", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Tab>"] = { "snippet_forward", "fallback" },
			},
		},
	},
}
