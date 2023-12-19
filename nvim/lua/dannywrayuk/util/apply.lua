-- Apply the keys from one table onto another

local apply = function(source, target)
	for key, value in pairs(source) do
		target[key] = value
	end
	return target
end

return apply
