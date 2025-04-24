return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			enable = true,
			layout = {
				preview = false,
				layout = {
					backdrop = false,
				},
			},
		},
	},
	keys = {
		{
			"<leader>t",
			function()
				Snacks.picker.explorer({
					layout = {
						preset = "default",
					},
					auto_close = true,
					jump = { close = true },
				})
			end,
			desc = "File Explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		-- {
		-- 	"<leader>,",
		-- 	function()
		-- 		Snacks.picker.buffers()
		-- 	end,
		-- 	desc = "Buffers",
		-- },
		{
			"<leader>fr",
			function()
				Snacks.picker.recent({ focus = "list" })
			end,
			desc = "Recent",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_branches({
					win = {
						input = {
							keys = {
								["<S-CR>"] = { "git_branch_add", mode = { "i" } },
							},
						},
					},
				})
			end,
			desc = "Git Branches",
		},
		-- Grep
		-- {
		-- 	"<leader>sb",
		-- 	function()
		-- 		Snacks.picker.lines()
		-- 	end,
		-- 	desc = "Buffer Lines",
		-- },
		-- {
		-- 	"<leader>sB",
		-- 	function()
		-- 		Snacks.picker.grep_buffers()
		-- 	end,
		-- 	desc = "Grep Open Buffers",
		-- },
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word({ focus = "list" })
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader>fD",
			function()
				Snacks.picker.diagnostics({ focus = "list" })
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics_buffer({ focus = "list" })
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>f;",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>f.",
			function()
				Snacks.picker.pickers()
			end,
			desc = "All Pickers",
		},
	},
}
