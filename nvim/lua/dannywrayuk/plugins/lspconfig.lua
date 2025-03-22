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
		local keymaps = function(buffer)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ buffer = buffer, desc = "See available code actions" }
			)

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
				buffer = buffer,
				desc = "Smart rename",
			})

			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
				buffer = buffer,
				desc = "Show line diagnostics",
			})

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
				buffer = buffer,
				desc = "Go to previous diagnostic",
			})

			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
				buffer = buffer,
				desc = "Go to next diagnostic",
			})

			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ buffer = buffer, desc = "Show documentation for symbol under cursor" }
			)

			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {
				buffer = buffer,
				desc = "Restart LSP",
			})

			vim.keymap.set("n", "<leader>i", function()
				local clients = vim.lsp.get_clients({ name = "vtsls" })
				clients[1].request("workspace/executeCommand", {
					command = "typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}, nil, 0)
			end, { buffer = buffer, desc = "Organise imports" })
		end

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"lua_ls",
				"graphql",
				"eslint",
				"vtsls",
				"denols",
				"rnix",
			},
			automatic_installation = true,
		})

		local lspConfigBuilder = function(extend)
			return function(server_name)
				local config = {
					capabilities = require("blink.cmp").get_lsp_capabilities(),
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
			["vtsls"] = lspConfigBuilder({
				root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json"),
				single_file_support = false,
			}),
			["denols"] = lspConfigBuilder({
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			}),
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
