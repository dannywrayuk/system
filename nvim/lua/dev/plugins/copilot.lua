return {
	"github/copilot.vim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.keymap.set("i", "<A-c>c", "<Plug>(copilot-dismiss)")
		vim.keymap.set("i", "<A-c>e", function()
			vim.cmd("Copilot enable")
		end)
		vim.keymap.set("i", "<A-c>d", function()
			vim.cmd("Copilot disable")
		end)
		vim.keymap.set("i", "<A-c>n", "<Plug>(copilot-suggest)")
		vim.keymap.set("i", "<A-c>l", "<Plug>(copilot-next)")
		vim.keymap.set("i", "<A-c>h", "<Plug>(copilot-previous)")
	end,
}
