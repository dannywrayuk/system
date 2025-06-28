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

local getRootDir = function(markers)
	return function(buf, on_dir)
		local bufferPath = vim.fs.dirname(vim.api.nvim_buf_get_name(buf))
		local matches = vim.fs.find(markers, {
			path = bufferPath,
			upward = true,
			limit = 1,
		})
		if #matches == 1 then
			return on_dir(vim.fn.fnamemodify(matches[1], ":p:h"))
		end
		on_dir(vim.fs.dirname(vim.fs.find(".git", { path = bufferPath, upward = true })[1]))
	end
end

vim.lsp.config("vtsls", {
	single_file_support = false,
	root_dir = getRootDir({ "package.json" }),
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
	root_dir = getRootDir({ "README.md", "main.go", "go.mod", "LICENSE", ".git" }),
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
