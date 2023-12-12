local nnoremap = function(key, map)
	vim.keymap.set("n", key, map, { silent = true })
end

local inoremap = function(key, map)
	vim.keymap.set("i", key, map, { silent = true })
end

local vnoremap = function(key, map)
	vim.keymap.set("v", key, map, { silent = true })
end

-- remap for uk keyboard lol
inoremap("£", "#")

-- change window
nnoremap("<leader>w", "<C-w>")

-- last window
nnoremap("<leader>s", "<C-^>")

-- moving lines
local option_j = "∆"
local option_k = "˚"

nnoremap(option_j, ":m .+1<CR>==")
nnoremap(option_k, ":m .-2<CR>==")
inoremap(option_j, "<Esc>:m .+1<CR>==gi")
inoremap(option_k, "<Esc>:m .-2<CR>==gi")
vnoremap(option_j, ":m '>+1<CR>gv=gv")
vnoremap(option_k, ":m '<-2<CR>gv=gv")

-- duplicate lines
local shift_option_j = "Ô"
local shift_option_k = ""

nnoremap(shift_option_k, ":t .-1<CR>")
nnoremap(shift_option_j, ":t .<CR>")
inoremap(shift_option_j, "<Esc>:t .<CR>==gi")
inoremap(shift_option_k, "<Esc>:t .-1<CR>==gi")
vnoremap(shift_option_j, ":t '<-1<CR>gv=gv")
vnoremap(shift_option_k, ":t '><CR>gv=gv")
