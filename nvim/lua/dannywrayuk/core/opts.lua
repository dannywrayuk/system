-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.g.mapleader = " "

-- fat boi
vim.opt.guicursor = ""

-- window boarder
-- vim.o.winborder = "rounded"

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- no commandline
-- vim.opt.cmdheight = 0
-- causes issues with some plugins

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- word wrap
vim.opt.wrap = true

-- search highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- add buffer to top and bottom scroll
vim.opt.scrolloff = 8

vim.opt.isfname:append("@-@")
vim.opt.signcolumn = "no"
vim.opt.updatetime = 50

-- dont show the default mode thing
vim.opt.showmode = false

-- add column for linelength
-- vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

-- dont add comment on newlines
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- always split to the right
vim.opt.splitright = true

-- default to vertical splits
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
