local keymap = require("dannywrayuk.util.keymap")
return {
	"tpope/vim-fugitive",
	config = function()
		keymap.set("n", "<leader>gg", function()
			vim.cmd("Git")
			vim.cmd("wincmd H")
			vim.cmd("wincmd 50|")
		end, { desc = "Open fugitive status to the side" })

		local fugitive_augroup = vim.api.nvim_create_augroup("fugitiveMaps", { clear = true })

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = "fugitive",
			group = fugitive_augroup,
			callback = function()
				keymap.set("n", "gp", function()
					vim.cmd("G push")
				end, { desc = "Push commits", buffer = true })
			end,
		})
	end,
}
