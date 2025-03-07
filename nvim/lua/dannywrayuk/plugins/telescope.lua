return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local keymap = require("dannywrayuk.util.keymap")
		local option = require("dannywrayuk.util.option-keys")
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local layout = require("telescope.actions.layout")
		local themes = require("telescope.themes")

		local function add_to_quickfix(prompt_bufnr)
			actions.smart_send_to_qflist(prompt_bufnr)
			builtin.quickfix()
		end

		telescope.setup({
			defaults = themes.get_dropdown({
				results_title = false,
				sorting_strategy = "ascending",
				layout_config = {
					height = 0.5,
					prompt_position = "top",
				},
				mappings = {
					i = {
						["<C-p>"] = layout.toggle_preview,
						[option.a] = actions.select_all,
						[option.t] = actions.toggle_all,
						[option.q] = add_to_quickfix,
					},
					n = {
						["<C-p>"] = layout.toggle_preview,
						[option.a] = actions.select_all,
						[option.t] = actions.toggle_all,
						[option.q] = add_to_quickfix,
					},
				},
				preview = {
					hide_on_startup = true,
				},
			}),
			pickers = {
				git_branches = {
					mappings = { n = { ["<C-n>"] = "git_create_branch" }, i = { ["<C-n>"] = "git_create_branch" } },
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Open list of all files in PWD" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope: Search all files using grep string" })

		keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope: Open list of all recently opened files" })

		keymap.set("n", "<leader>ft", builtin.builtin, { desc = "Telescope: Open list of all builtin lists" })
		keymap.set("n", "<leader>f;", builtin.resume, { desc = "Telescope: Open last telescope" })
		keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope: Open list of all keymaps" })

		keymap.set("n", "<leader>fr", function()
			builtin.buffers({ sort_mru = true, ignore_current_buffer = true, initial_mode = "normal" })
		end, { desc = "Telescope: Open list of recent buffers" })

		keymap.set(
			"n",
			"<leader>fg",
			builtin.git_branches,
			{ desc = "Telescope: Open list of git branches in current repo" }
		)

		keymap.set("n", "<leader>fd", function()
			builtin.diagnostics({ initial_mode = "normal" })
		end, { desc = "Telescope: Open list of diagnostics in the current file" })
	end,
}
