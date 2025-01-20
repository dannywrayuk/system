local openMarkdownSplit = require("dannywrayuk.util.openMarkdownSplit")
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
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
		local keymap = require("dannywrayuk.util.keymap")
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local keymaps = function(buffer)
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

			keymap.set("n", "<leader>i", function()
				local clients = vim.lsp.get_clients({ name = "vtsls" })
				clients[1].request("workspace/executeCommand", {
					command = "typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}, nil, 0)
			end, { buffer = buffer, desc = "Organise imports" })

			keymap.set("n", "<leader>sk", function()
				vim.lsp.buf_request(0, "textDocument/hover", vim.lsp.util.make_position_params(), function(err, result)
					if err or not (result and result.contents) then
						vim.api.nvim_err_writeln("No information")
						return
					end
					openMarkdownSplit(vim.lsp.util.convert_input_to_markdown_lines(result.contents))
				end)
			end, { buffer = buffer, desc = "Show hover information in tab" })

			keymap.set("n", "<leader>sd", function()
				local diagnostics =
					vim.diagnostic.get(vim.api.nvim_get_current_buf(), { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
				local messages = {}
				for _, diagnostic in ipairs(diagnostics) do
					table.insert(messages, diagnostic.message)
				end
				openMarkdownSplit(messages)
			end, { buffer = buffer, desc = "Show diagnostics in tab" })
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
					capabilities = capabilities,
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
