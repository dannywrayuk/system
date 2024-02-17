local M = {}

local currentChangeCount = hs.pasteboard.changeCount()

local s = {
	pollFrequency = 2,
	pasteboardHistoryFileName = hs.fs.pathToAbsolute("~/.pasteboardHistory"),
	historyEntryFormat = function(entry)
		return "[" .. os.date("%d/%m/%y %X") .. "]\n" .. entry .. "\n"
	end,
}

local onPastebordChange = function()
	local content = hs.pasteboard.getContents()
	if content ~= nil then
		local pasteboardHistoryFile = io.open(s.pasteboardHistoryFileName, "a")
		-- if pasteboardHistoryFile == nil then
		-- 	print("Could not find pasteboardHistoryFile, using console as backup:")
		-- 	print(content)
		-- 	return
		-- end
		pasteboardHistoryFile:write(s.historyEntryFormat(content))
		pasteboardHistoryFile:close()
	end
end

local pastePoll = hs.timer.new(s.pollFrequency, function()
	local changeCount = hs.pasteboard.changeCount()
	if changeCount > currentChangeCount then
		currentChangeCount = changeCount
		onPastebordChange()
	end
end)

M.start = function()
	pastePoll:start()
end

M.clearHistory = function()
	local pasteboardHistoryFile = io.open(s.pasteboardHistoryFileName, "w")
	pasteboardHistoryFile:write(s.historyEntryFormat("Paste History was cleared"))
	pasteboardHistoryFile:close()
end

return M
