local mergeTables = require "git-staging-window.mergeTables"

M = {
    commands = {
        refresh = "<C-r>",
        toggleCurrent = "<tab>",
        toggleAll = "<S-tab>",
        addAll = "A",
        restoreAll = "R",
        discardAll = "D",
        discardCurrent = "d",
    },
    highlights = {
        custom = {
            GitStagingWindow_StatusModified = { bg = 'NONE', fg = '#ffca1e' },
            GitStagingWindow_StatusAdded = { bg = 'NONE', fg = '#67f257' },
            GitStagingWindow_StatusDeleted = { bg = 'NONE', fg = '#db2121' },
        },
        status = {
            modified = "GitStagingWindow_StatusModified",
            added = "GitStagingWindow_StatusAdded",
            deleted = "GitStagingWindow_StatusDeleted",
        },
        window = {
            normal = "Normal",
            border = "Normal"
        },
        file = {
            name = "Normal",
            path = "Conceal"
        }
    },
    window = {
        width = 70,
        height = 30,
        border = "rounded",
    },
    gitStatus = {
        highlightMap = {
            ["A"] = "added",
            ["?"] = "added",
            ["D"] = "deleted",
        },
        symbolMap = {
            ["?"] = "U"
        }
    },
    updateConfig = function (updates)
        mergeTables(M, updates)
    end,
    createHighlights = function ()
        for k, v in pairs(M.highlights.custom) do
            vim.api.nvim_set_hl(0, k, v)
        end
    end,
}

return M
