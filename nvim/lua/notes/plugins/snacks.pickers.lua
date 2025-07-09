local p = require("core.pickers")

local function human_readable_date(date_str)
	local y, m, d = date_str:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")
	if not y or not m or not d then
		return nil
	end
	local t = { year = y, month = m, day = d }
	local timestamp = os.time(t)
	return os.date("%a, %d %b %Y", timestamp)
end

local daily = function()
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

local newTemplate = function()
	Snacks.picker.smart({
		multi = { "files" },
		title = "New Note",
		cwd = "Templates",
	})
end

local tags = function()
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

local links = function() end

local backLinks = function() end

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
				git_branches = { layout = { preset = "dannywrayuk" } },
			},
			actions = {
				toggle_preview = p.toggle_preview,
				explorer_up = p.explorer_up,
				explorer_focus = p.explorer_focus,
			},
			layouts = {
				dannywrayuk = p.layout,
			},
		},
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
	},
	keys = {
		{ "<leader>t", p.explorer, desc = "File Explorer" },
		{ "<leader>ff", p.smart, desc = "Smart Find Files" },
		{ "<leader>fn", daily, desc = "List Daily Notes" },
		{ "<leader>ft", newTemplate, desc = "New note from template" },
		{ "<leader>fg", tags, desc = "Find Tags" },
		{ "<leader>fr", p.recent, desc = "Recent" },
		{ "<leader>fl", p.lines, desc = "Buffer Lines" },
		{ "<leader>fo", p.lines_word, desc = "Buffer Word Occurrences" },
		{ "<leader>fs", p.grep, desc = "Grep" },
		{ "<leader>fw", p.grep_word, desc = "Visual selection or word", mode = { "n", "x" } },
		{ "<leader>f;", p.resume, desc = "Resume" },
		{ "zs", p.spelling, desc = "Spell Suggestions" },
		{ "<leader>f.", p.pickers, desc = "All Pickers" },
	},
}
