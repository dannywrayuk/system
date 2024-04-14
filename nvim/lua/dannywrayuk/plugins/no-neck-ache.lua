return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		local keymap = require("dannywrayuk.util.keymap")
		keymap.set("n", "<leader>n", ":NoNeckPain<CR>")
	end,
}
