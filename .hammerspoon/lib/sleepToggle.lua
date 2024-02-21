local M = {}

local menuBar = nil

M.toggle = function()
	local input = hs.dialog.blockAlert("Sleep Toggle", "This action requires root access", "Enable", "Disable")
	if input == "Enable" then
		if menuBar ~= nil then
			menuBar:delete()
		end
		os.execute("sudo pmset -a disablesleep 0")
	else
		if menuBar == nil then
			menuBar =
				hs.menubar.new(true, "hsSleepToggleDisabled"):setTitle("Sleep Disabled"):setClickCallback(M.toggle)
		end
		os.execute("sudo pmset -a disablesleep 1")
	end
end

return M
