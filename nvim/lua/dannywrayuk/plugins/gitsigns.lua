return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local keymap = require("dannywrayuk.util.keymap")
		local gitsigns = require("gitsigns")
		gitsigns.setup()

		keymap.set("n", "<leader>gb", gitsigns.blame, { desc = "Open git blame history" })
	end,
}
