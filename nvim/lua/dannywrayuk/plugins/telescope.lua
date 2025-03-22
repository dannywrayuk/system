return {
	"nvim-telescope/telescope.nvim",
	commit = "814f102cd1da3dc78c7d2f20f2ef3ed3cdf0e6e4",
	lazy = true,
	event = { "VeryLazy" },
	dependencies = {
		{ "nvim-telescope/telescope-ui-select.nvim", lazy = true },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
	},
	opts = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local layout = require("telescope.actions.layout")
		local themes = require("telescope.themes")

		local addToQuickfix = function(prompt_bufnr)
			actions.smart_send_to_qflist(prompt_bufnr)
			builtin.quickfix()
		end

		local createOrCheckoutBranch = function(prompt_bufnr)
			local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
			if current_picker.manager:num_results() == 0 then
				actions.git_create_branch(prompt_bufnr)
				actions.close(prompt_bufnr)
				return
			end
			actions.git_checkout(prompt_bufnr)
		end

		require("telescope.pickers.layout_strategies").horizontal_merged = function(
			picker,
			max_columns,
			max_lines,
			layout_config
		)
			local l =
				require("telescope.pickers.layout_strategies").horizontal(picker, max_columns, max_lines, layout_config)

			l.prompt.borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

			l.results.title = ""
			l.results.borderchars = { "─", "│", "─", "│", "├", "┤", "┘", "└" }
			l.results.line = l.results.line - 1
			l.results.height = l.results.height + 1

			if type(l.preview) ~= "table" then
				return l
			end
			l.preview.title = ""
			l.preview.borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

			return l
		end

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Open list of all files in CWD" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope: Search all files using grep string" })

		vim.keymap.set(
			"n",
			"<leader>fo",
			builtin.oldfiles,
			{ desc = "Telescope: Open list of all recently opened files" }
		)

		vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "Telescope: Open list of all builtin lists" })
		vim.keymap.set("n", "<leader>f;", builtin.resume, { desc = "Telescope: Open last telescope" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope: Open list of all keymaps" })

		vim.keymap.set(
			"n",
			"<leader>fg",
			builtin.git_branches,
			{ desc = "Telescope: Open list of git branches in current repo" }
		)

		vim.keymap.set("n", "<leader>fd", function()
			builtin.diagnostics({ initial_mode = "normal" })
		end, { desc = "Telescope: Open list of diagnostics in the current file" })

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		return {
			defaults = themes.get_dropdown({
				sorting_strategy = "ascending",
				layout_strategy = "horizontal_merged",
				layout_config = {
					height = math.min(80 / 2.5, math.floor(0.9 * vim.o.lines)),
					prompt_position = "top",
				},
				mappings = {
					i = {
						["<C-p>"] = layout.toggle_preview,
						["<A-a>"] = actions.select_all,
						["<A-t>"] = actions.toggle_all,
						["<A-q>"] = addToQuickfix,
					},
					n = {
						["<C-p>"] = layout.toggle_preview,
						["<A-a>"] = actions.select_all,
						["<A-t>"] = actions.toggle_all,
						["<A-q>"] = addToQuickfix,
					},
				},
				preview = {
					hide_on_startup = true,
				},
			}),
			pickers = {
				git_branches = {
					show_remote_tracking_branches = false,
					mappings = {
						i = {
							["<CR>"] = createOrCheckoutBranch,
						},
					},
				},
			},
		}
	end,
}
