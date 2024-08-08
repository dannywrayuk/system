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
vim.opt.wrap = true

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

-- add column for linelength
-- vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

-- dont add comment on newlines
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]])

-- always split to the right
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

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

-- Create a custom namespace
-- local ns_id = vim.api.nvim_create_namespace("EveryFifthLine")

-- -- Define the function to highlight every fifth line relative to the cursor position
-- local function highlight_relative_fifth_lines()
-- 	-- Define a highlight group for the full line
-- 	-- vim.cmd("highlight clear Col§orColumn")

-- 	-- Get the current buffer
-- 	local bufnr = vim.api.nvim_get_current_buf()

-- 	-- Clear existing extmarks in the custom namespace
-- 	vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

-- 	-- Get the current cursor position
-- 	local cursor_line = vim.fn.line(".") - 1 -- Lua indexing starts at 0

-- 	-- Get the total number of lines in the buffer
-- 	local total_lines = vim.fn.line("$")

-- 	-- Add new extmarks for every 5th line relative to the cursor position
-- 	for i = cursor_line % 5, (total_lines-total_lines % 5) -1, 5 do
-- 		vim.api.nvim_buf_set_extmark(bufnr, ns_id, i, 0, {
-- 			end_line = i + 1,
-- 			hl_group = "ColorColumn",
-- 			hl_eol = true,
-- 		})
-- 	end
-- end

-- -- Create a new augroup
-- local every_fifth_line_group = vim.api.nvim_create_augroup("EveryFifthLine", { clear = true })

-- -- Create autocommands in the new augroup
-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved" }, {
-- 	group = every_fifth_line_group,
-- 	callback = highlight_relative_fifth_lines,
-- })
