-- Options

-- Leader
vim.g.mapleader = " "

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- CHONKY BOI
vim.opt.guicursor = ""

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Word wrap
vim.opt.wrap = true

-- Search highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Add buffer to top and bottom scroll
vim.opt.scrolloff = 8

-- Dont show the default mode thing
vim.opt.showmode = false

-- Highlight current line
vim.opt.cursorline = true

-- No swapfile or backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.isfname:append("@-@")
vim.opt.signcolumn = "no"
vim.opt.updatetime = 50

-- Always split to the right
vim.opt.splitright = true
local verticalTypes = {
	help = true,
	qf = true,
}
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("move_window_right", {}),
	callback = function()
		local moveVertical = verticalTypes[vim.o.filetype] or false
		if moveVertical then
			vim.cmd.wincmd("L")
		end
	end,
})

-- Dont add comment on newlines
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

-- set diagnostic symbols
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})

-- Keymaps

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

-- Remap for uk keyboard lol
vim.keymap.set("i", "£", "#")

-- Why is this key even a thing
vim.keymap.set({ "n", "v", "i", "t" }, "§", "<Esc>")

-- Moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Duplicate lines
vim.keymap.set("n", "<A-J>", ":t .<CR>")
vim.keymap.set("n", "<A-K>", ":t .-1<CR>")
vim.keymap.set("i", "<A-J>", "<Esc>:t .-1<CR>==gi")
vim.keymap.set("i", "<A-K>", "<Esc>:t .<CR>==gi")
vim.keymap.set("v", "<A-J>", ":t '<-1<CR>gv=gv")
vim.keymap.set("v", "<A-K>", ":t '><CR>gv=gv")

-- Match current
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

vim.keymap.set({ "n", "v" }, "<A-r>", [["hy:%s/<C-r>h/<C-r>h/g<left><left>]])

-- Comment toggle
vim.keymap.set("n", "<leader>?", ":Commentary<CR>")
vim.keymap.set("v", "<leader>?", ":Commentary<CR> gv")

-- Center while moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<A-y>", [["+y]])

-- Paste last yanked
vim.keymap.set({ "n" }, "<A-p>", [["0p]])

-- Update spellings
vim.keymap.set("n", "zB", ":mkspell! " .. vim.fn.stdpath("config") .. "/spell/en.utf-8.add<CR>")

-- Open file in github
vim.keymap.set("n", "<leader>gb", ":lua Snacks.gitbrowse()<CR>")

-- go to definition
vim.keymap.set("n", "<leader><leader>", function()
	vim.lsp.buf.definition()
end, { desc = "Go to definiton of current word" })
