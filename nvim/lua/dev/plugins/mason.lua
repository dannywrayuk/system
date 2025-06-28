return {
	"mason-org/mason.nvim",
	dependencies = {
		{ "mason-org/mason-lspconfig.nvim", lazy = true },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", lazy = true },
	},
	lazy = true,
	event = { "VeryLazy" },
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"lua_ls",
				"graphql",
				"eslint",
				"vtsls",
				-- "denols",
				"rnix",
				"gopls",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
			},
		})
	end,
}
