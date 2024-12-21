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
				["<Left>"] = { "hide" },
				["<Right>"] = { "show", "accept" },
				["<Up>"] = { "select_prev" },
				["<Down>"] = { "select_next" },
				["<Tab>"] = { "snippet_forward", "fallback" },
			},
		},
	},
}
