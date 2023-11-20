local staging = require "git-staging-window.staging"
local updateContent = require "git-staging-window.updateContent"
local gitStatus = require "git-staging-window.gitStatus"
local config = require "git-staging-window.config"

local M = {}

M.setup = function (userConfig)
    config.updateConfig(userConfig)
end

local buf = nil
local win = nil

M.closeWindow = function ()
    vim.api.nvim_buf_delete(buf, {})
    buf = nil
    win = nil
end


M.openWindow = function()
    if gitStatus.checkInRepo() == false then return end

    if buf == nil then
        buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        vim.api.nvim_create_autocmd('BufEnter', {
            buffer = buf,
            callback = function()
                vim.keymap.set("n", config.commands.refresh, function ()
                    updateContent(buf)
                end)
                vim.keymap.set("n", config.commands.toggleCurrent, function ()
                    staging.toggleCurrent()
                    updateContent(buf)
                end)
                vim.keymap.set("n", config.commands.toggleAll, function ()
                    staging.toggleAll()
                    updateContent(buf)
                end)
                vim.keymap.set( "n", config.commands.addAll, function ()
                    staging.addAll()
                    updateContent(buf)
                end)
                vim.keymap.set("n", config.commands.restoreAll, function ()
                    staging.restoreAll()
                    updateContent(buf)
                end)
                vim.keymap.set("n", "<esc>", M.closeWindow)
                config.createHighlights()
            end
        })
        vim.api.nvim_create_autocmd('BufLeave', {
            buffer = buf,
            callback = function ()
                M.closeWindow()
            end
        })
        updateContent(buf)
    end

    if win == nil then
        local ui = vim.api.nvim_list_uis()[1]
        local opts = {
            relative= 'editor',
            width= config.window.width,
            height= config.window.height,
            col= (ui.width/2) - (config.window.width/2),
            row= (ui.height/2) - (config.window.height/2),
            anchor= 'NW',
            style= 'minimal',
            border= config.window.border,
        }
        win = vim.api.nvim_open_win(buf, 1, opts)
        vim.api.nvim_win_set_option(win, 'winhighlight',
            'Normal:'
            .. config.highlights.window.normal
            .. ',FloatBorder:'
            .. config.highlights.window.border
        )
    end
end

return M
