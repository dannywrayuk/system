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

-- LSP keymaps
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Show line diagnostics" })

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "Show documentation for symbol under cursor" })

vim.keymap.set("n", "<leader>i", function()
	vim.lsp
		.get_clients({
			name = "vtsls",
		})
		.request("workspace/executeCommand", {
			command = "typescript.organizeImports",
			arguments = { vim.api.nvim_buf_get_name(0) },
		}, nil, 0)
end, { desc = "Organise imports" })

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

-- LSP Configurations

vim.lsp.config("vtsls", {
	single_file_support = false,
	root_dir = function(startpath)
		local root_markers = { "package.json" }
		local matches = vim.fs.find(root_markers, {
			path = startpath,
			upward = true,
			limit = 1,
		})
		if #matches == 0 then
			return vim.fs.dirname(vim.fs.find(".git", { path = startpath, upward = true })[1])
		end
		local root_dir = vim.fn.fnamemodify(matches[1], ":p:h")
		return root_dir
	end,
})

vim.lsp.config("gopls", {
	cmd = { "env", "GO111MODULE=off", "gopls", "-remote=auto" },
	settings = {
		gopls = {
			buildFlags = { "-tags=integration" },
			staticcheck = true,
			expandWorkspaceToModule = false,
			["local"] = "github.com/monzo/wearedev",
		},
	},
	root_dir = function(startpath)
		local root_markers = { "README.md", "main.go", "go.mod", "LICENSE", ".git" }
		local matches = vim.fs.find(root_markers, {
			path = startpath,
			upward = true,
			limit = 1,
		})
		if #matches == 0 then
			return vim.fs.dirname(vim.fs.find(".git", { path = startpath, upward = true })[1])
		end
		local root_dir = vim.fn.fnamemodify(matches[1], ":p:h")
		return root_dir
	end,
	flags = {
		debounce_text_changes = 500,
	},
	init_options = {
		codelenses = {
			generate = true,
			gc_details = true,
			test = true,
			tidy = true,
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

vim.lsp.enable("sourcekit")

-- Load Plugins
require("dannywrayuk.lazy")
