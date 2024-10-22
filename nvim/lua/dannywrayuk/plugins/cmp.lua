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

		local SYMBOL_MAP = {
			Text = "󰦨",
			Method = "󰆧",
			Function = "󰆧",
			Constructor = "󰆧",
			Field = "",
			Variable = "",
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
				[types.lsp.CompletionItemKind.Property] = 0,
				[types.lsp.CompletionItemKind.Keyword] = 10,
				[types.lsp.CompletionItemKind.Text] = 20,
				[types.lsp.CompletionItemKind.Constant] = 20,
				[types.lsp.CompletionItemKind.Snippet] = 100,
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
			sources = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "path" },
			},
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					compareKind,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.sort_text,
					cmp.config.compare.kind,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			matching = {
				disallow_fuzzy_matching = true,
				disallow_fullfuzzy_matching = true,
				disallow_partial_fuzzy_matching = true,
				disallow_partial_matching = true,
			},
			confirmation = {
				default_behavior = cmp.ConfirmBehavior.Replace,
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					item.kind = SYMBOL_MAP[item.kind] or "󰢤"
					if #item.abbr < 15 then
						item.abbr = string.format("%-15s", item.abbr)
					end
					if #item.abbr > 30 then
						item.abbr = string.sub(item.abbr, 1, 29) .. "…"
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
