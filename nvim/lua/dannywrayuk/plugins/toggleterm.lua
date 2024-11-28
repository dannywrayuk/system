return {
	"akinsho/nvim-toggleterm.lua",
	config = function()
		local toggleterm = require("toggleterm")
		local keymap = require("dannywrayuk.util.keymap")

		toggleterm.setup({
			hide_number = true,
			start_in_insert = true,
			direction = "float",
		})
		keymap.set({ "n", "t" }, "<C-q>", "<cmd>ToggleTerm<CR>", { desc = "Toggles the ToggleTerm" })
	end,
}
