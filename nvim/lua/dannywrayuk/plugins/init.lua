return {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "tpope/vim-commentary", lazy = true, event = { "BufReadPre", "BufNewFile" } },
	{ "kamykn/spelunker.vim", lazy = true, event = { "BufReadPre", "BufNewFile" } },
	{
		"norcalli/nvim-colorizer.lua",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup()
		end,
	},
}
