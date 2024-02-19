local M = {}

local sign = function(num)
	if num < 0 then
		return -1
	end
	return 1
end

local numOfLinesToScroll = 3
local onScroll = function(event)
	local continuous = event:getProperty(hs.eventtap.event.properties.scrollWheelEventIsContinuous)

	-- The scroll event for scroll wheels is usually not continuous unless you have a fancy mouse
	if continuous == 1 then
		return false
	end

	local scrollDirection = sign(event:getProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1))
	-- Invert vertical scroll and disable acceleration
	event:setProperty(hs.eventtap.event.properties.scrollWheelEventDeltaAxis1, -scrollDirection * numOfLinesToScroll)
	return false
end

local scrollEventListener = hs.eventtap.new({ hs.eventtap.event.types.scrollWheel }, onScroll)

M.start = function()
	scrollEventListener:start()
end

return M
