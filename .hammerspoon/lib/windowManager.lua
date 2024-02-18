local M = {}

M.fillScreen = function()
	local currentWindow = hs.window.frontmostWindow()
	currentWindow:maximize(0)
	print(hs.inspect(currentWindow))
end

M.fillLeftFraction = function()
	local currentWindow = hs.window.frontmostWindow()
	currentWindow:moveToUnit({ 0.0, 0.0, 0.5, 1 }, 0)
end

M.fillRightFraction = function()
	local currentWindow = hs.window.frontmostWindow()
	currentWindow:moveToUnit({ 0.5, 0, 0.5, 1 }, 0)
end

M.center = function()
	local currentWindow = hs.window.frontmostWindow()
	currentWindow:centerOnScreen(nil, nil, 0)
end

M.toggleScreen = function()
	local currentWindow = hs.window.frontmostWindow()
	local currentScreen = currentWindow:screen()
	local allScreens = hs.screen.allScreens()
	if #allScreens == 1 then
		return
	end
	for index, screen in ipairs(allScreens) do
		if screen == currentScreen then
			currentWindow:moveToScreen(allScreens[index % #allScreens + 1], nil, nil, 0)
			return
		end
	end
end

return M
