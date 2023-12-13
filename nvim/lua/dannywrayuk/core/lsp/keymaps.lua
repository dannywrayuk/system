local opts = { noremap = true, silent = true }
local on_attach = function(buffnr)
	opts.buffer = buffnr

	opts.desc = "Go to definition"
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

	opts.desc = "See available code actions"
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

	opts.desc = "Smart rename"
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	opts.desc = "Show line diagnostics"
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = "Go to previous diagnostic"
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

	opts.desc = "Go to next diagnostic"
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	opts.desc = "Show documentation for symbol under cursor"
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = "Restart LSP"
	vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
end

return {
	on_attach = on_attach,
}
