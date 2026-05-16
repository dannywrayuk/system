local M = {}

M.layout = {
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

M.toggle_preview = function(picker)
	if picker.layout.opts.preview then
		picker:set_layout(M.layout)
		Snacks.picker.actions.toggle_preview(picker)
	else
		picker:set_layout("sidebar")
	end
end

M.explorer_up = function()
	vim.cmd("cd ..")
end

M.explorer_focus = function(picker)
	vim.cmd("cd" .. picker:dir())
end

M.explorer = function(opts)
	Snacks.picker.explorer(vim.tbl_deep_extend("force", {
		auto_close = true,
		jump = { close = true },
		exclude = { ".git", ".DS_Store" },
		hidden = true,
	}, opts or {}))
end

M.smart = function()
	Snacks.picker.smart({
		title = "Find Files",
	})
end

M.directory = function()
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
			M.explorer({
				cwd = vim.fs.joinpath(gitroot, item.file),
				follow_file = false,
			})
		end,
	})
end

M.recent = function()
	Snacks.picker.recent({
		focus = "list",
		layout = { preset = "sidebar" },
	})
end

M.git_branches = function()
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

M.lines = function()
	Snacks.picker.lines({
		layout = {
			preview = "main",
			preset = "sidebar",
		},
	})
end

M.lines_word = function()
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

M.grep = function()
	Snacks.picker.grep({
		layout = { preset = "sidebar" },
	})
end

M.grep_word = function()
	Snacks.picker.grep_word({
		focus = "list",
		layout = { preset = "sidebar" },
	})
end

M.diagnostics = function()
	Snacks.picker.diagnostics({
		focus = "list",
		layout = { preset = "sidebar" },
	})
end

M.diagnostics_buffer = function()
	Snacks.picker.diagnostics_buffer({
		focus = "list",
		layout = { preset = "sidebar" },
	})
end

M.help = function()
	Snacks.picker.help()
end

M.resume = function()
	Snacks.picker.resume()
end

M.spelling = function()
	Snacks.picker.spelling()
end

M.pickers = function()
	Snacks.picker.pickers()
end

return M
