return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>pp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file" })
	end,
}
