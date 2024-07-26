local keymap = require("dannywrayuk.util.keymap")
local option = require("dannywrayuk.util.option-keys")

-- remap for uk keyboard lol
keymap.set("i", "£", "#")

-- last buffer
keymap.set("n", "<leader>s", "<C-^>")

-- moving lines
keymap.set("n", option.j, ":m .+1<CR>==")
keymap.set("n", option.k, ":m .-2<CR>==")
keymap.set("i", option.j, "<Esc>:m .+1<CR>==gi")
keymap.set("i", option.k, "<Esc>:m .-2<CR>==gi")
keymap.set("v", option.j, ":m '>+1<CR>gv=gv")
keymap.set("v", option.k, ":m '<-2<CR>gv=gv")

-- duplicate lines
keymap.set("n", option.shift.j, ":t .<CR>")
keymap.set("n", option.shift.k, ":t .-1<CR>")
keymap.set("i", option.shift.j, "<Esc>:t .-1<CR>==gi")
keymap.set("i", option.shift.k, "<Esc>:t .<CR>==gi")
keymap.set("v", option.shift.j, ":t '<-1<CR>gv=gv")
keymap.set("v", option.shift.k, ":t '><CR>gv=gv")

-- match current
keymap.set({ "n", "v" }, option.d, function()
	vim.cmd([[:norm *Ngny]])
	local selection = vim.fn.getreg("0")
	vim.ui.input({ prompt = "", default = selection }, function(i)
		if i == nil then
			return
		end
		vim.cmd(":norm gnc" .. i)
	end)
end)

-- comment toggle
keymap.set("n", "<leader>?", ":Commentary<CR>")
keymap.set("v", "<leader>?", ":Commentary<CR> gv")

-- center while moving
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- yank to system clipboard
keymap.set({ "n", "v" }, option.s .. "y", [["+y]])

-- paste last yanked
keymap.set({ "n", "v" }, option.s .. "p", [["0p]])

-- log
local languageLogs = {
	javascript = "console.log()",
	javascriptreact = "console.log()",
	typescript = "console.log()",
	typescriptreact = "console.log()",
	lua = "print()",
}
keymap.set({ "n", "i" }, option.l, function()
	local log = languageLogs[vim.o.filetype]
	if log then
		vim.cmd(":norm a" .. log)
		vim.cmd(":startinsert")
	else
		print("no log format for: " .. vim.o.filetype)
	end
end, { desc = "Add log statement at cursor" })

-- git commands

keymap.set("n", "<leader>gp", function()
	vim.ui.input({ prompt = "Commit Message" }, function(input)
		if input == nil then
			return
		end
		vim.cmd('Git commit -q -m "' .. input .. '"')
		vim.cmd("Git push -q")
	end)
end, { desc = "Commit and Push staged changes" })

keymap.set("n", "<leader>ga", function()
	vim.ui.input({ prompt = "Commit Message" }, function(input)
		if input == nil then
			return
		end
		print("Git Push")
		vim.cmd("Git add --all")
		vim.cmd('Git commit -q -m "' .. input .. '"')
		vim.cmd("Git push -q")
		print("Done.")
	end)
end, { desc = "Commit and Push all changes" })
