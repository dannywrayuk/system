local gitStatus = require "git-staging-window.gitStatus"

return function (line)
    if line == 1 then
        return nil
    end
    local changes = gitStatus.getCurrentChanges()
    if line == #changes.staged + 2 then
        return nil
    end
    if line > #changes.staged + 2 then
        return changes.unstaged[line - #changes.staged - 2]
    end
    if line < #changes.staged + 2 then
        return changes.staged[line - 1]
    end
    if line > #changes.staged + #changes.unstaged then
        return nil
    end
    return nil
end
