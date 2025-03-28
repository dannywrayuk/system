local M = {}

M.cwd = function(pane)
	local paneCwd = pane:get_current_working_dir()
	if paneCwd then
		local filePath = paneCwd.file_path
		if filePath then
			return filePath
		end
	end
	return "-"
end

local split = function(s, delimiter)
	local result = {}
	for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match)
	end
	return result
end

M.basepath = function(str)
	local pathSplit = split(str, "/")
	local base = pathSplit[#pathSplit]
	if #base == 0 then
		return "-"
	end
	return base
end

return M
