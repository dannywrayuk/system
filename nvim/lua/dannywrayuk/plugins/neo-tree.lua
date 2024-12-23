return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require("neo-tree")
		local screenSizeSwap = require("dannywrayuk.util.screenSizeSwap")
		local renderer = require("neo-tree.ui.renderer")
		local fsc = require("neo-tree.sources.filesystem.commands")
		local cc = require("neo-tree.sources.common.commands")

		local initialTreePosition = function()
			return screenSizeSwap("bottom", "float")
		end
		vim.g.neoTreePosition = initialTreePosition()

		-- disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local goToParent = function(state)
			local node = state.tree:get_node()
			renderer.focus_node(state, node:get_parent_id())
		end

		local goToParentAndClose = function(state)
			goToParent(state)
			local node = state.tree:get_node()
			if node:is_expanded() then
				fsc.toggle_node(state)
			end
		end

		local openAndCloseTree = function(state)
			local node = state.tree:get_node()
			if node.type == "directory" then
				fsc.toggle_node(state)
			else
				cc.open(state)
				cc.close_window(state)
			end
		end

		local toggleWindowPosition = function(state)
			cc.close_window(state)
			if vim.g.neoTreePosition == "left" then
				vim.g.neoTreePosition = initialTreePosition()
			else
				vim.g.neoTreePosition = "left"
			end
			require("neo-tree.command").execute({ position = vim.g.neoTreePosition })
		end

		vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { link = "NeoTreeGitAdded" })

		neotree.setup({
			commands = {
				goToParentAndClose = goToParentAndClose,
				openAndCloseTree = openAndCloseTree,
				toggleWindowPosition = toggleWindowPosition,
			},
			window = {
				auto_expand_width = true,
				height = "50%",
				popup = {
					title = function()
						return ""
					end,
				},
				mappings = {
					["<Left>"] = "goToParentAndClose",
					["h"] = "goToParentAndClose",
					["<Right>"] = "openAndCloseTree",
					["l"] = "openAndCloseTree",
					["<CR>"] = "openAndCloseTree",
					["<esc>"] = "close_window",
					["T"] = "toggleWindowPosition",
					["t"] = "none",
				},
			},
			hide_root_node = true,
			close_if_last_window = true,
			retain_hidden_root_indent = true,
			popup_border_style = "rounded",
			use_popups_for_input = false,
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					show_hidden_count = false,
					hide_by_name = {
						".git",
					},
				},
			},
			default_component_configs = {
				icon = {
					default = "",
					folder_open = "",
					folder_empty_open = "",
					folder_closed = "",
					folder_empty = "",
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						added = "A",
						modified = "M",
						conflict = "!",
						unstaged = "",
						staged = "",
						renamed = "R",
						untracked = "U",
						deleted = "D",
						ignored = "",
					},
				},
				modified = {
					symbol = "",
					highlight = "NeoTreeModified",
				},
			},
		})

		local keymap = require("dannywrayuk.util.keymap")
		keymap.set("n", "<leader>t", function()
			if vim.g.neoTreePosition ~= "left" then
				vim.g.neoTreePosition = initialTreePosition()
			end
			require("neo-tree.command").execute({
				position = vim.g.neoTreePosition,
				reveal = true,
				reveal_force_cwd = true,
			})
		end, { desc = "Open Neotree" })
	end,
}
