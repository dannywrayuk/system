return {
	"akinsho/nvim-toggleterm.lua",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			open_mapping = [[<leader>q]],
			hide_number = true,
			start_in_insert = true,
			direction = "float",
		})
	end,
}
