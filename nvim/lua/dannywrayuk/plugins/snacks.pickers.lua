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
		picker:set_layout("sidebar")
	end
end

local explorer_up = function()
	vim.cmd("cd ..")
end

local explorer_focus = function(picker)
	vim.cmd("cd" .. picker:dir())
end

local explorer = function(opts)
	Snacks.picker.explorer(vim.tbl_deep_extend("force", {
		auto_close = true,
		jump = { close = true },
		exclude = { ".git", ".DS_Store" },
		hidden = true,
	}, opts or {}))
end

local smart = function()
	Snacks.picker.smart({
		title = "Find Files",
	})
end

local directory = function()
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
			picker:close()
			vim.schedule(function()
				explorer({ cwd = vim.fs.joinpath(gitroot, item.file) })
			end)
		end,
	})
end

local recent = function()
	Snacks.picker.recent({ focus = "list" })
end

local git_branches = function()
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
end

local lines = function()
	Snacks.picker.lines({
		layout = {
			preview = "main",
			preset = "sidebar",
		},
	})
end

local lines_word = function()
	Snacks.picker.lines({
		layout = {
			preview = "main",
			preset = "sidebar",
		},
		focus = "list",
		matcher = {
			fuzzy = false,
		},
		on_show = function(picker)
			local current_line = vim.api.nvim_win_get_cursor(picker.main)[1]
			for i, item in ipairs(picker:items()) do
				if item.idx == current_line then
					picker.list:view(i)
					Snacks.picker.actions.list_scroll_center(picker)
					break
				end
			end
		end,
		pattern = function(picker)
			return picker:word()
		end,
	})
end

local grep = function()
	Snacks.picker.grep()
end

local grep_word = function()
	Snacks.picker.grep_word({ focus = "list" })
end

local diagnostics = function()
	Snacks.picker.diagnostics({ focus = "list" })
end

local diagnostics_buffer = function()
	Snacks.picker.diagnostics_buffer({
		focus = "list",
		layout = { preset = "sidebar" },
	})
end

local help = function()
	Snacks.picker.help()
end

local resume = function()
	Snacks.picker.resume()
end

local spelling = function()
	Snacks.picker.spelling()
end

local pickers = function()
	Snacks.picker.pickers()
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
				spelling = { layout = { preset = "dannywrayuk" } },
			},
			actions = {
				toggle_preview = toggle_preview,
				explorer_up = explorer_up,
				explorer_focus = explorer_focus,
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
		{ "<leader>t", explorer, desc = "File Explorer" },
		{ "<leader>ff", smart, desc = "Smart Find Files" },
		{ "<leader>fn", directory, desc = "Find Directory" },
		{ "<leader>fr", recent, desc = "Recent" },
		{ "<leader>fg", git_branches, desc = "Git Branches" },
		{ "<leader>fl", lines, desc = "Buffer Lines" },
		{ "<leader>fo", lines_word, desc = "Buffer Word Occurrences" },
		{ "<leader>fs", grep, desc = "Grep" },
		{ "<leader>fw", grep_word, desc = "Visual selection or word", mode = { "n", "x" } },
		{ "<leader>fD", diagnostics, desc = "Diagnostics" },
		{ "<leader>fd", diagnostics_buffer, desc = "Buffer Diagnostics" },
		{ "<leader>fh", help, desc = "Help Pages" },
		{ "<leader>f;", resume, desc = "Resume" },
		{ "zs", spelling, desc = "Spell Suggestions" },
		{ "<leader>f.", pickers, desc = "All Pickers" },
	},
}
