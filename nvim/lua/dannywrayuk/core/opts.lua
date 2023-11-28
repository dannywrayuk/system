-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.g.mapleader = " "

-- fat boi
vim.opt.guicursor = ""

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- word wrap
vim.opt.wrap = false

-- search highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- add buffer to top and bottom scroll
vim.opt.scrolloff = 8

vim.opt.isfname:append("@-@")
vim.opt.signcolumn = "no"
vim.opt.updatetime = 50

-- dont show the default mode thing
vim.opt.showmode = false

-- dont add comment on newlines
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

-- always split to the right
vim.opt.splitright = true