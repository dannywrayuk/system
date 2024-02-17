local switchWindow = require("lib.switchWindow")
local pasteHistory = require("lib.pasteHistory")

hs.hotkey.bind({ "ctrl" }, "1", switchWindow({ "Chrome" }))
hs.hotkey.bind({ "ctrl" }, "2", switchWindow({ "Obsidian" }))
hs.hotkey.bind({ "ctrl" }, "3", switchWindow({ "iTerm2" }))
hs.hotkey.bind({ "ctrl" }, "4", switchWindow({ "Microsoft Teams" }))

pasteHistory.start()
hs.hotkey.bind({ "cmd", "shift" }, "C", pasteHistory.clearHistory)
