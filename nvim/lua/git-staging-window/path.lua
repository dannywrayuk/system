local escape = function(str)
    if not str then return str end
    return str:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", function(c) return "%" .. c end)
end

return function (fullPath)
    if fullPath == nil then return {} end
    local fileName = fullPath:match("([^/]+)$")
    if fileName == nil then
        return {
            fullPath = fullPath,
        }
    end
    local path = fullPath:gsub(escape(fileName), "")
    local extension = fileName:match(".+[.]([^.]+)$")
    local name = fileName:gsub(escape(extension) or "", ""):gsub("[.]$", "")
    return {
        fullPath = fullPath,
        path = path,
        fileName = fileName,
        name = name,
        extension = extension,
    }
end
