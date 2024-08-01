return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("hardtime").setup({ disabled_filetypes = { "DressingInput" } })
		local keymap = require("dannywrayuk.util.keymap")
		keymap.set("n", "<leader>ht", ":Hardtime toggle<CR>")
	end,
}
