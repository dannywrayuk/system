---@diagnostic disable: undefined-field
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local types = require("cmp.types")
		require("luasnip.loaders.from_vscode").lazy_load()

		local function get_lsp_completion_context(completion, source)
			local ok, source_name = pcall(function()
				return source.source.client.config.name
			end)
			if not ok then
				return nil
			end
			if source_name == "tsserver" then
				return completion.detail
			end
		end

		local SYMBOL_MAP = {
			Text = "󰦨",
			Method = "󰆧",
			Function = "󰆧",
			Constructor = "󰆧",
			Field = "",
			Variable = "",
			Class = "",
			Interface = "",
			Module = "󰅩",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}

		local function border(hl_name)
			return {
				{ "╭", hl_name },
				{ "─", hl_name },
				{ "╮", hl_name },
				{ "│", hl_name },
				{ "╯", hl_name },
				{ "─", hl_name },
				{ "╰", hl_name },
				{ "│", hl_name },
			}
		end

		local kindPriority = function(kind)
			return ({
				[types.lsp.CompletionItemKind.Variable] = 0,
				[types.lsp.CompletionItemKind.Method] = 0,
				[types.lsp.CompletionItemKind.Field] = 0,
				[types.lsp.CompletionItemKind.Text] = 0,
				[types.lsp.CompletionItemKind.Property] = 0,
				[types.lsp.CompletionItemKind.Constant] = 0,
				[types.lsp.CompletionItemKind.Snippet] = 100,
				[types.lsp.CompletionItemKind.Keyword] = 100,
			})[kind] or 50
		end
		local compareKind = function(a, b)
			local kind1 = kindPriority(a:get_kind())
			local kind2 = kindPriority(b:get_kind())
			if kind1 ~= kind2 then
				return kind1 - kind2 < 0
			end
		end

		cmp.setup({
			completion = {
				completeopt = "menu,menuone",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<Right>"] = cmp.mapping.confirm({ select = true }),
				["<Left>"] = function()
					if cmp.visible() then
						cmp.close()
					else
						cmp.complete()
					end
				end,
				["<C-i>"] = cmp.mapping.scroll_docs(-1),
				["<C-e>"] = cmp.mapping.scroll_docs(1),
			}),
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					compareKind,
					cmp.config.compare.score,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					local completion_context = get_lsp_completion_context(entry.completion_item, entry.source)
					item.kind = SYMBOL_MAP[item.kind] or "󰢤"
					if #item.abbr < 25 then
						item.abbr = string.format("%-25s", item.abbr)
					end
					if completion_context ~= nil and completion_context ~= "" then
						item.menu = completion_context
					end
					return item
				end,
			},
			performance = {
				max_view_entries = 20,
			},
			window = {
				completion = {
					side_padding = 1,
					winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None",
					scrollbar = false,
					border = border("FloatBorder"),
				},
				documentation = {
					border = border("FloatBorder"),
					winhighlight = "Normal:Normal",
				},
			},
		})
	end,
}
