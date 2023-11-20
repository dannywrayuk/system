local getCommandOutput = require "git-staging-window.getCommandOutput"
local getChangeOnLine  = require "git-staging-window.getChangeOnLine"
local gitStatus        = require "git-staging-window.gitStatus"

local M = {}

M.toggleCurrent = function()
    local lineNumbers = vim.api.nvim_win_get_cursor(0)
    local row = lineNumbers[1]
    local change = getChangeOnLine(row)
    if change == nil then return end
    if change.staged then
        local _, _, error = getCommandOutput({"git", "restore", "-S", change.file.fullPath})
        if error[1] ~= nil then
            print(error[1])
        end
    else
        local _, _, error = getCommandOutput({"git", "add", change.file.fullPath})
        if error[1] ~= nil then
            print(error[1])
        end

    end
end

M.toggleAll = function()
    local lineNumbers = vim.api.nvim_win_get_cursor(0)
    local row = lineNumbers[1]
    local change = getChangeOnLine(row)
    if change == nil then
        change = {}
        local changes = gitStatus.getCurrentChanges()
        if #changes.staged == 0 then
            change.staged = false
        elseif #changes.unstaged == 0 then
            change.staged = true
        else
            change.staged = row == 1
        end
    end
    if change.staged then
        M.restoreAll()
    else
        M.addAll()
    end
end


M.addAll = function ()
    local _, _, error = getCommandOutput({"git", "add", "."})
    if error[1] ~= nil then
        print(error[1])
    end

end

M.restoreAll = function ()
    local _, _, error = getCommandOutput({"git", "restore", "-S", "."})
    if error[1] ~= nil then
        print(error[1])
    end

end

return M
