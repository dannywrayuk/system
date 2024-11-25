return function(path)
	local f = assert(io.open(path, "rb"))
	local content = f:read("*all")
	f:close()
	return content
end
