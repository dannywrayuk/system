return function(branch)
	if branch == nil or #branch == 0 then
		return ""
	end
	local startIndex, endIndex = string.find(branch, "^%l+/%u+-%d+")
	if startIndex == nil then
		return ""
	end
	return string.gsub(string.sub(branch, startIndex, endIndex), "/", ": ") .. " "
end
