return {
	"neovim/nvim-lspconfig",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	commit = "8b0f47d851ee5343d38fe194a06ad16b9b9bd086",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", lazy = true, commit = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245" },
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
				root_dir = function(startpath)
					local root_markers = { "package.json" }
					local matches = vim.fs.find(root_markers, {
						path = startpath,
						upward = true,
						limit = 1,
					})
					if #matches == 0 then
						return lspconfig.util.find_git_ancestor(startpath)
					end
					local root_dir = vim.fn.fnamemodify(matches[1], ":p:h")
					return root_dir
				end,
			}),
			["gopls"] = lspConfigBuilder({
				cmd = { "env", "GO111MODULE=off", "gopls", "-remote=auto" },
				settings = {
					gopls = {
						buildFlags = { "-tags=integration" },
						staticcheck = true,
						expandWorkspaceToModule = false,
						["local"] = "github.com/monzo/wearedev",
					},
				},
				root_dir = function(startpath)
					local root_markers = { "README.md", "main.go", "go.mod", "LICENSE", ".git" }
					local matches = vim.fs.find(root_markers, {
						path = startpath,
						upward = true,
						limit = 1,
					})
					if #matches == 0 then
						return lspconfig.util.find_git_ancestor(startpath)
					end
					local root_dir = vim.fn.fnamemodify(matches[1], ":p:h")
					return root_dir
				end,
				flags = {
					debounce_text_changes = 500,
				},
				init_options = {
					codelenses = {
						generate = true,
						gc_details = true,
						test = true,
						tidy = true,
					},
				},
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
