local getCommandOutput = require "git-staging-window.getCommandOutput"
local parseGitStatusList = require "git-staging-window.parseGitStatusList"

local checkInRepo = function ()
    local _, _, error = getCommandOutput({"git", "tag"})
    if error[1] ~= nil then
        print(error[1])
        return false
    end
    return true
end

local emptyChanges = {staged = {}, unstaged = {}}
local changes = emptyChanges

local getChanges = function ()
    if checkInRepo() == false then
        changes = emptyChanges
        return changes
    end
    local gitOutput, _, error = getCommandOutput({ "git", "status", "-uall", "-z", "--", ":/" })
    if error[1] ~= nil then
        print(error[1])
        changes = emptyChanges
        return changes
    end

    if gitOutput[1] == nil then
        changes = emptyChanges
        return changes
    end

    local changesArray = vim.split(gitOutput[1], "\0", { trimempty = true })
    changes = parseGitStatusList(changesArray)
    return changes
end

local getCurrentChanges = function()
   return changes
end

return {
    getChanges = getChanges,
    getCurrentChanges = getCurrentChanges,
    checkInRepo = checkInRepo
}
