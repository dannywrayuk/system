return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
		})

		-- Save without formatting
		vim.api.nvim_create_user_command("W", function()
			vim.cmd("noautocmd write")
		end, {})

		return {
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
				go = { "gofmt" },
			},
		}
	end,
}
