local switchWindow = require("lib.switchWindow")
local pasteHistory = require("lib.pasteHistory")
local windowManager = require("lib.windowManager")
local scrollWheelfix = require("lib.scrollWheelFix")
local sleepToggle = require("lib.sleepToggle")

scrollWheelfix:start()

hs.hotkey.bind({ "ctrl" }, "1", switchWindow({ "Chrome" }))
hs.hotkey.bind({ "ctrl" }, "2", switchWindow({ "Obsidian" }))
hs.hotkey.bind({ "ctrl" }, "3", switchWindow({ "iTerm2" }))
hs.hotkey.bind({ "ctrl" }, "4", switchWindow({ "Microsoft Teams" }))

pasteHistory.start()
hs.hotkey.bind({ "cmd", "shift" }, "K", pasteHistory.clearHistory)
hs.hotkey.bind({ "cmd", "shift" }, "C", pasteHistory.showHistory)

hs.hotkey.bind({ "ctrl", "alt" }, "space", windowManager.fillScreen)

hs.hotkey.bind({ "ctrl", "alt" }, "left", windowManager.fillLeftFraction)
hs.hotkey.bind({ "ctrl", "alt" }, "H", windowManager.fillLeftFraction)

hs.hotkey.bind({ "ctrl", "alt" }, "right", windowManager.fillRightFraction)
hs.hotkey.bind({ "ctrl", "alt" }, "L", windowManager.fillRightFraction)

hs.hotkey.bind({ "ctrl", "alt" }, "up", windowManager.center)
hs.hotkey.bind({ "ctrl", "alt" }, "K", windowManager.center)

hs.hotkey.bind({ "ctrl", "alt" }, "down", windowManager.toggleScreen)
hs.hotkey.bind({ "ctrl", "alt" }, "J", windowManager.toggleScreen)

hs.hotkey.bind({ "ctrl", "alt" }, "S", sleepToggle.toggle)
