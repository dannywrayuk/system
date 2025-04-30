return {
	"saghen/blink.cmp",
	-- dependencies = {
	-- 	"rafamadriz/friendly-snippets",
	-- },
	lazy = true,
	event = { "VeryLazy" },
	version = "v0.14.0",
	opts = {
		cmdline = {
			enabled = true,
			completion = {
				menu = { auto_show = true },
			},
			keymap = {
				["<CR>"] = { "select_accept_and_enter", "fallback" },
				["<Left>"] = { "hide", "fallback" },
				["<Right>"] = { "accept", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
			},
		},
		signature = { enabled = true },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			accept = { auto_brackets = { enabled = false } },
			list = {
				selection = { preselect = true, auto_insert = false },
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 1000,
			},
		},
		keymap = {
			preset = "none",
			["<Left>"] = { "hide", "fallback" },
			["<Right>"] = { "accept", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<S-Up>"] = { "scroll_documentation_up", "fallback" },
			["<S-Down>"] = { "scroll_documentation_down", "fallback" },
			["<S-Right>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
		},
	},
}
