local M = {}

M.toRGB = function(col)
	col = string.lower(col)
	return { tonumber(col:sub(2, 3), 16), tonumber(col:sub(4, 5), 16), tonumber(col:sub(6, 7), 16) }
end

M.blend = function(foreground, background, alpha)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = M.toRGB(background)
	local fg = M.toRGB(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

M.breadcrumb = function(path)
	if path == nil or path == "" then
		return ""
	end
	return path:gsub("/", "  ")
end

M.readFile = function(path)
	local f = assert(io.open(path, "rb"))
	local content = f:read("*all")
	f:close()
	return content
end

return M
