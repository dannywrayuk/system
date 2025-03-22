return {
	"NeogitOrg/neogit",
	dependencies = {
		{ "sindrets/diffview.nvim", lazy = true },
	},
	lazy = true,
	keys = {
		{ "<leader>z" },
	},
	opts = function()
		vim.keymap.set("n", "<leader>z", function()
			vim.cmd(":Neogit kind=vsplit")
		end)

		return {
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
			mappings = {
				status = { ["<Esc>"] = "Close" },
			},
		}
	end,
}
