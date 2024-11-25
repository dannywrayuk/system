local M = {}

local getBatteryColor = function(palette, batteryPercentage)
	if batteryPercentage > 75 then
		return palette.green
	end
	if batteryPercentage > 20 then
		return palette.yellow
	end
	return palette.red
end

M.pill = function(info, pills, palette)
	local batteryPercentage = string.format("%.0f%%", info.state_of_charge * 100)
	if info.state == "Charging" then
		return pills.pill(" " .. batteryPercentage, palette.green)
	end
	if info.state == "Full" then
		return pills.pill("", palette.green)
	end
	return pills.pill_label("", batteryPercentage, getBatteryColor(palette, info.state_of_charge * 100))
end

return M
