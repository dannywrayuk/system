local M = {}

local function human_readable_date(date_str)
	local y, m, d = date_str:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")
	if not y or not m or not d then
		return nil
	end
	local t = { year = y, month = m, day = d }
	local timestamp = os.time(t)
	return os.date("%a, %d %b %Y", timestamp)
end

M.daily = function()
	Snacks.picker({
		title = "Daily Notes",
		finder = "proc",
		cmd = "zsh",
		args = { "-c", "fd . Daily | sort -r" },
		format = function(item, picker)
			return { { " " .. item.text } }
		end,
		transform = function(item)
			if item.done then
				return
			end
			item.done = true
			item.file = item.text
			local filename = vim.fn.fnamemodify(item.text, ":t:r")
			item.text = filename .. "\t\t" .. human_readable_date(filename)
		end,
	})
end

M.newTemplate = function()
	Snacks.picker.smart({
		multi = { "files" },
		title = "New Note",
		cwd = "Templates",
		confirm = function(picker, item)
			picker:close()
			vim.cmd("FromTemplate " .. vim.fn.fnamemodify(item.file, ":r"))
		end,
	})
end

M.tags = function()
	Snacks.picker({
		title = "Tags",
		finder = "proc",
		cmd = "zsh",
		args = { "-c", [[rg -oI '#\w+' | sort | uniq]] },
		format = function(item, picker)
			return { { " " .. item.text } }
		end,
		transform = function(item)
			item.file = item.text
		end,
		confirm = function(picker, item)
			Snacks.picker.grep_word({
				title = "Tag: " .. item.file,
				search = item.file,
			})
		end,
	})
end

M.backlinks = function()
	local filePath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.:r")
	if filePath == "" then
		print("No file is currently open.")
		return
	end
	local _, depth = filePath:gsub("/", "")
	if depth > 3 then
		depth = 3
	end
	local filename = vim.fn.fnamemodify(filePath, ":t:r")
	local searchStrings = filename
	local prev = filename
	for i = 1, depth do
		searchStrings = searchStrings .. "|" .. vim.fn.fnamemodify(filePath, string.rep(":h", i) .. ":t") .. "/" .. prev
	end

	vim.schedule(function()
		local input = require("snacks.picker.core.input")
		local statuscolumn = input.statuscolumn
		input.statuscolumn = function(self)
			if self.picker.opts.no_status == true then
				return "%#SnacksPickerPrompt# %*"
			else
				return statuscolumn(self)
			end
		end
	end)

	Snacks.picker.grep({
		title = "Backlinks",
		search = [[\[\[(]] .. searchStrings .. [[)(\|[^] ]+)?\]\] ]],
		focus = "list",
		no_status = true,
		regex = true,
		live = false,
	})
end

return M
