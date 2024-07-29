return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({
			disable_hint = true,
			kind = "auto",
			signs = {
				hunk = { "", "" },
				item = { "", "" },
				section = { "", "" },
			},
			sections = {
				stashes = { hidden = true },
				recent = { folded = false },
			},
			status = {
				show_head_commit_hash = false,
				HEAD_folded = true,
				recent_commit_count = 20,
				mode_padding = 1,
				HEAD_padding = 1,
				mode_text = {
					M = "M",
					N = "A",
					A = "A",
					D = "D",
					C = "C",
					U = "U",
					R = "R",
					DD = "D",
					AU = "A",
					UD = "U",
					UA = "U",
					DU = "D",
					AA = "A",
					UU = "U",
					["?"] = "",
				},
			},
		})

		local keymap = require("dannywrayuk.util.keymap")
		keymap.set("n", "<leader>z", ":Neogit kind=vsplit<CR>")
	end,
}
