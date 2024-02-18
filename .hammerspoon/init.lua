local switchWindow = require("lib.switchWindow")
local pasteHistory = require("lib.pasteHistory")
local windowManager = require("lib.windowManager")

hs.hotkey.bind({ "ctrl" }, "1", switchWindow({ "Chrome" }))
hs.hotkey.bind({ "ctrl" }, "2", switchWindow({ "Obsidian" }))
hs.hotkey.bind({ "ctrl" }, "3", switchWindow({ "iTerm2" }))
hs.hotkey.bind({ "ctrl" }, "4", switchWindow({ "Microsoft Teams" }))

pasteHistory.start()
hs.hotkey.bind({ "cmd", "shift" }, "C", pasteHistory.clearHistory)

hs.hotkey.bind({ "ctrl", "alt" }, "return", windowManager.fillScreen)
hs.hotkey.bind({ "ctrl", "alt" }, "left", windowManager.fillLeftFraction)
hs.hotkey.bind({ "ctrl", "alt" }, "right", windowManager.fillRightFraction)
hs.hotkey.bind({ "ctrl", "alt" }, "up", windowManager.center)
hs.hotkey.bind({ "ctrl", "alt" }, "down", windowManager.toggleScreen)
