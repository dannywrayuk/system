-- Add default options to keymaps
local ks = vim.keymap.set
vim.keymap.set = function(mode, key, action, opts)
	if type(opts) == "table" then
		opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts)
	else
		opts = { noremap = true, silent = true }
	end
	return ks(mode, key, action, opts)
end

-- remap for uk keyboard lol
vim.keymap.set("i", "£", "#")
-- why is this key even a thing
vim.keymap.set({ "n", "v", "i", "t" }, "§", "<Esc>")

-- moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- duplicate lines
vim.keymap.set("n", "<A-J>", ":t .<CR>")
vim.keymap.set("n", "<A-K>", ":t .-1<CR>")
vim.keymap.set("i", "<A-J>", "<Esc>:t .-1<CR>==gi")
vim.keymap.set("i", "<A-K>", "<Esc>:t .<CR>==gi")
vim.keymap.set("v", "<A-J>", ":t '<-1<CR>gv=gv")
vim.keymap.set("v", "<A-K>", ":t '><CR>gv=gv")

-- match current
vim.keymap.set({ "n", "v" }, "<A-d>", function()
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
vim.keymap.set("n", "<leader>?", ":Commentary<CR>")
vim.keymap.set("v", "<leader>?", ":Commentary<CR> gv")

-- center while moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<A-y>", [["+y]])

-- paste last yanked
vim.keymap.set({ "n" }, "<A-p>", [["0p]])

vim.keymap.set("n", "zB", ":mkspell! " .. vim.fn.stdpath("config") .. "/spell/en.utf-8.add<CR>")

-- open file in github
vim.keymap.set("n", "<leader>gb", ":lua Snacks.gitbrowse()<CR>")

-- log
local languageLogs = {
	javascript = "console.log()",
	javascriptreact = "console.log()",
	typescript = "console.log()",
	typescriptreact = "console.log()",
	lua = "print()",
}
vim.keymap.set({ "n", "i" }, "<A-l>", function()
	local log = languageLogs[vim.o.filetype]
	if log then
		vim.cmd(":norm a" .. log)
		vim.cmd(":startinsert")
	else
		print("no log format for: " .. vim.o.filetype)
	end
end, { desc = "Add log statement at cursor" })
