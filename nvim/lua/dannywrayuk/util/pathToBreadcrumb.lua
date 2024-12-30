return function(path)
	if path == nil or path == "" then
		return ""
	end
	return path:gsub("/", "  ")
end
