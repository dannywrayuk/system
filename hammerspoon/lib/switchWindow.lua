return function(names)
	return function()
		for _, name in ipairs(names) do
			local app = hs.application.find(name)
			local focusedApp = hs.window.focusedWindow():application()
			if focusedApp ~= app then
				if app == nil then
					print("Cant find app: " .. name)
				elseif app:mainWindow() == nil then
					print("App not running:" .. name)
				else
					app:activate()
					return
				end
			end
		end
	end
end
