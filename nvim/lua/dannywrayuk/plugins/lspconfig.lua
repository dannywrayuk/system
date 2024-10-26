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
		local keymap = require("dannywrayuk.util.keymap")
		local keymaps = function(buffer)
			keymap.set("n", "gd", vim.lsp.buf.definition, {
				buffer = buffer,
				desc = "Go to definition",
			})

			keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ buffer = buffer, desc = "See available code actions" }
			)

			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
				buffer = buffer,
				desc = "Smart rename",
			})

			keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
				buffer = buffer,
				desc = "Show line diagnostics",
			})

			keymap.set("n", "[d", vim.diagnostic.goto_prev, {
				buffer = buffer,
				desc = "Go to previous diagnostic",
			})

			keymap.set("n", "]d", vim.diagnostic.goto_next, {
				buffer = buffer,
				desc = "Go to next diagnostic",
			})

			keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ buffer = buffer, desc = "Show documentation for symbol under cursor" }
			)

			keymap.set("n", "<leader>rs", ":LspRestart<CR>", {
				buffer = buffer,
				desc = "Restart LSP",
			})

			keymap.set("n", "<leader>o", function()
				vim.lsp.buf.execute_command({
					command = "typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				})
			end, { buffer = buffer, desc = "Organise imports" })
		end

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
						keymaps(buffnr)
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
