return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("i", "<C-d>", "<Plug>(copilot-dismiss)")
	end,
}
