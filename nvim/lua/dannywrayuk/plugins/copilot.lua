return {
	"github/copilot.vim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local option = require("dannywrayuk.util.option-keys")

		vim.keymap.set("i", option.c .. "c", "<Plug>(copilot-dismiss)")
		vim.keymap.set("i", option.c .. "e", function()
			vim.cmd("Copilot enable")
		end)
		vim.keymap.set("i", option.c .. "d", function()
			vim.cmd("Copilot disable")
		end)
		vim.keymap.set("i", option.c .. "n", "<Plug>(copilot-suggest)")
		vim.keymap.set("i", option.c .. "l", "<Plug>(copilot-next)")
		vim.keymap.set("i", option.c .. "h", "<Plug>(copilot-previous)")
	end,
}
