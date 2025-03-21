return {
	"nvim-telescope/telescope.nvim",
	commit = "814f102cd1da3dc78c7d2f20f2ef3ed3cdf0e6e4",
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

		telescope.setup({
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
