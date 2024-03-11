local keymap = require("dannywrayuk.util.keymap")
return {
	"tpope/vim-fugitive",
	config = function()
		keymap.set("n", "<leader>z", function()
			vim.cmd("Git | only")
		end, { desc = "Open fugitive status full screen" })

		local fugitive_augroup = vim.api.nvim_create_augroup("fugitiveMaps", { clear = true })

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = "fugitive",
			group = fugitive_augroup,
			callback = function()
				keymap.set("n", "<leader>z", ':echo "Fugitive already open"<CR>', { desc = "Fugitive dedupe", buffer = true })
				keymap.set("n", "S", ":G add --all <CR>", { desc = "Stage all", buffer = true })
				keymap.set("n", "gp", ":G push <CR>", { desc = "Push commits", buffer = true })
				keymap.set(
					"n",
					"<leader>t",
					":bd | Neotree float reveal<CR>",
					{ desc = "Close fugitive before opening neotree", buffer = true }
				)
				vim.api.nvim_create_autocmd({ "BufLeave" }, {
					group = fugitive_augroup,
					pattern = "<buffer>",
					callback = function(tb)
						vim.api.nvim_buf_delete(tb.buf, {})
					end,
				})
			end,
		})
	end,
}
