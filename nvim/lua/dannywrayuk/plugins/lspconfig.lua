return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "●",
			},
			severity_sort = true,
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local lspKeymaps = require("dannywrayuk.core.lsp.keymaps")

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"lua_ls",
				"graphql",
				"eslint",
			},
			automatic_installation = true,
		})

		local lspConfigBuilder = function(extend)
			return function(server_name)
				local config = {
					capabilities = cmp_nvim_lsp.default_capabilities(),
					on_attach = function(_, buffnr)
						lspKeymaps.on_attach(buffnr)
					end,
				}

				if extend ~= nil then
					for i, j in pairs(extend) do
						config[i] = j
					end
				end
				return lspconfig[server_name].setup(config)
			end
		end

		mason_lspconfig.setup_handlers({
			lspConfigBuilder(),
			["graphql"] = lspConfigBuilder({
				filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
			})("graphql"),
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
	end,
}
