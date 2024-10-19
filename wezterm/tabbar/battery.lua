local M = {}

local getBatteryColor = function(palette, batteryPercentage)
	if batteryPercentage > 75 then
		return palette.brights[3]
	end
	if batteryPercentage > 20 then
		return palette.brights[4]
	end
	return palette.brights[2]
end

M.pill = function(info, pills, palette)
	local batteryPercentage = string.format("%.0f%%", info.state_of_charge * 100)
	if info.state == "Charging" then
		return pills.pill(" " .. batteryPercentage, palette.brights[3])
	end
	if info.state == "Full" then
		return pills.pill("", palette.brights[3])
	end
	return pills.pill_label("", batteryPercentage, getBatteryColor(palette, info.state_of_charge * 100))
end

return M
