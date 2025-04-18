return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", lazy = true },
	},
	lazy = true,
	event = { "VeryLazy" },
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
			},
		})
	end,
}
