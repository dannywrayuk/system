local path = require "git-staging-window.path"

return function(changesArray)
    local staged = {}
    local unstaged = {}

    for _, i in ipairs(changesArray) do
        local fullPath = i:sub(4, -1)
        local status = i:sub(1, 3):gsub("%s+", "")
        local file = path(fullPath)
        local icon, iconColor = require'nvim-web-devicons'.get_icon(file.fileName, file.extension, {default = true})

        local change = {
            file = file,
            icon = icon,
            iconColor = iconColor,
            status = status,
            staged = false,
        }

        if i:sub(1, 1) == " " then
            table.insert(unstaged, change)
        else
            if status == "??" then
                table.insert(unstaged, change)
            else
                change.staged = true
                table.insert(staged, change)
            end
        end
    end

    return {
        staged = staged,
        unstaged = unstaged
    }
end
