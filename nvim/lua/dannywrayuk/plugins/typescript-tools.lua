return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		local tstools = require("typescript-tools")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local lspKeymaps = require("dannywrayuk.core.lsp.keymaps")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		tstools.setup({
			on_attach = function(_, buffnr)
				lspKeymaps.on_attach(buffnr)
			end,
			capabilities = capabilities,
			settings = {
				expose_as_code_action = "all",
			},
		})
	end,
}
