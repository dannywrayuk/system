local gitStatus = require "git-staging-window.gitStatus"
local config = require "git-staging-window.config"

local highlightSection = function(buf, color, line, startChar, length)
    vim.api.nvim_buf_add_highlight(buf, -1, color, line, startChar, startChar + length)
    return startChar + length
end

local addFileLines = function(buf, startLine, values)
    for index, value in ipairs(values) do
        local displayName = value.file.fileName or value.file.fullPath or "Error parsing filename"
        local displayPath =  value.file.path or ""
        local lineValue = (config.gitStatus.symbolMap[value.status] or value.status)
            .. "\t"
            .. value.icon
            .. " "
            .. displayName
            .. " "
            .. displayPath
        vim.api.nvim_buf_set_lines(buf, startLine + index - 1, startLine + index, false, { lineValue })
        local nextChar = 0
        nextChar = highlightSection(buf, config.highlights.status[config.gitStatus.highlightMap[value.status] or "modified"], startLine + index - 1, nextChar, 1)
        nextChar = highlightSection(buf, value.iconColor, startLine + index - 1, nextChar + 1, #value.icon)
        nextChar = highlightSection(buf, config.highlights.file.name, startLine + index - 1, nextChar + 1, #displayName)
        nextChar = highlightSection(buf, config.highlights.file.path, startLine + index - 1, nextChar + 1, #displayPath)
    end
    return startLine + #values
end

local addDividerLine = function(buf, startLine, message)
    vim.api.nvim_buf_set_lines(buf, startLine, startLine + 1, false, { message })
    return startLine + 1
end

local cleanUp = function(buf, startLine)
    local length = vim.api.nvim_buf_line_count(buf)
    vim.api.nvim_buf_set_lines(buf, startLine, length, false, {})
end

return function(buf)
    local changes = gitStatus.getChanges()
    local stagedTitle = "Staged Changes"
    local stagedCount = "[" .. #changes.staged .. "]"
    local unstagedTitle = "Changes"
    local unstagedCount = "[" .. #changes.unstaged .. "]"

    vim.api.nvim_buf_set_option(buf, "modifiable", true)

    local nextLine = 0
    nextLine = addDividerLine(buf, nextLine, stagedCount .." " ..stagedTitle)
    nextLine = addFileLines(buf, nextLine, changes.staged)
    nextLine = addDividerLine(buf, nextLine, unstagedCount .. " " .. unstagedTitle)
    nextLine = addFileLines(buf, nextLine, changes.unstaged)
    cleanUp(buf, nextLine)

    vim.api.nvim_buf_set_option(buf, "modifiable", false)
end
