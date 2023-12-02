return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local neotree = require("neo-tree")
        local renderer = require("neo-tree.ui.renderer")
        local fsc = require("neo-tree.sources.filesystem.commands")
        local cc = require("neo-tree.sources.common.commands")

        -- disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- diagnostic symbols
        vim.fn.sign_define("DiagnosticSignError",{text = "", texthl = "DiagnosticSignError"})
        vim.fn.sign_define("DiagnosticSignWarn",{text = "", texthl = "DiagnosticSignWarn"})
        vim.fn.sign_define("DiagnosticSignInfo",{text = "", texthl = "DiagnosticSignInfo"})
        vim.fn.sign_define("DiagnosticSignHint",{text = "󰌵", texthl = "DiagnosticSignHint"})

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

        local openOrExpand = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" then
                if not node:is_expanded() then
                    fsc.toggle_node(state)
                end
                vim.cmd('norm! j')
            else
                cc.preview(state)
            end
        end

        local openAndCloseTree = function (state)
            local node = state.tree:get_node()
            if node.type == "directory" then
                fsc.toggle_node(state)
            else
                cc.open(state)
                cc.close_window(state)
            end
        end

        local indexOf = function(array, value)
            for i, v in ipairs(array) do
                if v == value then
                    return i
                end
            end
            return nil
        end

        local getSiblings = function(state, node)
            local parent = state.tree:get_node(node:get_parent_id())
            local siblings = parent:get_child_ids()
            return siblings
        end

        local nextSibling = function(state)
            local node = state.tree:get_node()
            local siblings = getSiblings(state, node)
            if not node.is_last_child then
                local currentIndex = indexOf(siblings, node.id)
                local nextIndex = siblings[currentIndex + 1]
                renderer.focus_node(state, nextIndex)
            end
        end

        local prevSibling = function(state)
            local node = state.tree:get_node()
            local siblings = getSiblings(state, node)
            local currentIndex = indexOf(siblings, node.id)
            if currentIndex > 1 then
                local nextIndex = siblings[currentIndex - 1]
                renderer.focus_node(state, nextIndex)
            end
        end

        local firstSibling = function(state)
            local node = state.tree:get_node()
            local siblings = getSiblings(state, node)
            renderer.focus_node(state, siblings[1])
        end

        local lastSibling = function(state)
            local node = state.tree:get_node()
            local siblings = getSiblings(state, node)
            renderer.focus_node(state, siblings[#siblings])
        end

        vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { link = "NeoTreeGitAdded" })

        neotree.setup({
            commands = {
                goToParent = goToParent,
                goToParentAndClose = goToParentAndClose,
                openOrExpand = openOrExpand,
                openAndCloseTree = openAndCloseTree,
                nextSibling = nextSibling,
                prevSibling = prevSibling,
                firstSibling = firstSibling,
                lastSibling = lastSibling,
            },
            window= {
                mappings = {
                    ["h"] = "goToParent",
                    ["H"] = "goToParentAndClose",
                    ["l"] = "openOrExpand",
                    ["L"] = "openAndCloseTree",
                    ["J"] = "nextSibling",
                    ["K"] = "prevSibling",
                    ["<C-j>"] = "lastSibling",
                    ["<C-k>"] = "firstSibling",
                    ["<C-h>"] = "toggle_hidden",
                    ["Esc"] = "close_window",
                }
            },
            hide_root_node = true,
            retain_hidden_root_indent = true,
            use_popups_for_input = false,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    show_hidden_count = false,
                    hide_by_name = {
                        ".git"
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

        vim.keymap.set("n", "<leader>tt", function()
            require("neo-tree.command").execute({ position = "float"})
        end)
        vim.keymap.set("n", "<leader>th", function()
            require("neo-tree.command").execute({ position = "left"})
        end)
    end
}
