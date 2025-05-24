local layout = {
	preview = false,
	layout = {
		box = "horizontal",
		width = 0.5,
		height = 0.8,
		backdrop = false,
		{
			box = "vertical",
			border = "rounded",
			title = "{title} {live} {flags}",
			{ win = "input", height = 1, border = "bottom" },
			{ win = "list", border = "none" },
		},
		{ win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
	},
}

local toggle_preview = function(picker)
	if picker.layout.opts.preview then
		picker:set_layout(layout)
		Snacks.picker.actions.toggle_preview(picker)
	else
		picker:set_layout(vim.tbl_deep_extend("force", layout, { preview = true, layout = { width = 0.8 } }))
	end
end

return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			enable = true,
			layout = { preset = "dannywrayuk" },
			sources = {
				select = { layout = { preset = "select" } },
				explorer = { layout = { preset = "dannywrayuk" } },
			},
			actions = {
				toggle_preview = toggle_preview,
			},
			layouts = {
				dannywrayuk = layout,
			},
		},
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
	},
	keys = {
		{
			"<leader>t",
			function()
				Snacks.picker.explorer({
					auto_close = true,
					jump = { close = true },
					exclude = { ".git", ".DS_Store" },
					hidden = true,
				})
			end,
			desc = "File Explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.smart({
					title = "Find Files",
				})
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>fn",
			function()
				local gitroot = vim.fn.fnamemodify(vim.fn.finddir(".git", ".;"), ":h")
				Snacks.picker({
					title = "Find Directory",
					finder = "proc",
					cmd = "fd",
					args = { "--type", "d", "--hidden", "--exclude", ".git", "--max-depth", "1" },
					cwd = gitroot,
					transform = function(item)
						item.file = item.text
						item.dir = true
					end,
					confirm = function(picker, item)
						vim.cmd("cd " .. gitroot .. "/" .. item.text)
						picker:close()
						Snacks.picker.explorer({
							auto_close = true,
							jump = { close = true },
						})
					end,
				})
			end,
			desc = "Find Directory",
		},
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
					all = true,
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
		{
			"<leader>/",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
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
