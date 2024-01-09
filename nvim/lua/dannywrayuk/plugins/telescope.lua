return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local keymap = require("dannywrayuk.util.keymap")
		telescope.setup({
			defaults = {
				results_title = false,
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				mappings = {
					i = {
						["<C-p>"] = require("telescope.actions.layout").toggle_preview,
					},
				},
				preview = {
					hide_on_startup = true,
				},
			},
		})
		keymap.set("n", "<leader>ft", builtin.builtin, { desc = "Telescope: Open list of all builtin lists" })
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Open list of all files in PWD" })
		keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope: Open list of all recently opened files" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope: Search all files using grep string" })
		keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Telescope: Search all files using curent word" })
		keymap.set("n", "<leader>fr", function()
			builtin.buffers({ sort_mru = true, ignore_current_buffer = true, initial_mode = "normal" })
		end, { desc = "Telescope: Open list of recent buffers" })
		keymap.set(
			"n",
			"<leader>fgb",
			builtin.git_branches,
			{ desc = "Telescope: Open list of git branches in current repo" }
		)
		keymap.set(
			"n",
			"<leader>fgc",
			builtin.git_commits,
			{ desc = "Telescope: Open list of all commits on the current branch" }
		)
		keymap.set("n", "<leader>fd", function()
			builtin.diagnostics({ initial_mode = "normal" })
		end, { desc = "Telescope: Open list of diagnostics in the current file" })
		keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope: Open list of all keymaps" })
	end,
}
