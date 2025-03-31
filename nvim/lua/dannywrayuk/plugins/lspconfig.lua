return {
	"neovim/nvim-lspconfig",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", lazy = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

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

		local lspConfigBuilder = function(extend)
			return function(server_name)
				local config = {
					capabilities = require("blink.cmp").get_lsp_capabilities(),
				}
				return lspconfig[server_name].setup(vim.tbl_extend("force", config, extend or {}))
			end
		end

		mason_lspconfig.setup_handlers({
			lspConfigBuilder(),
			["vtsls"] = lspConfigBuilder({
				single_file_support = false,
			}),
			-- disables deno
			["denols"] = function() end,
			["lua_ls"] = lspConfigBuilder({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			}),
		})

		lspConfigBuilder()("sourcekit")
	end,
}
