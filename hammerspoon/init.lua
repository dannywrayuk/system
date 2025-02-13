local switchWindow = require("lib.switchWindow")
local windowManager = require("lib.windowManager")
local scrollWheelfix = require("lib.scrollWheelFix")
local sleepToggle = require("lib.sleepToggle")
local doubleTapShift = require("lib.doubleTapShift")

doubleTapShift:start()
scrollWheelfix:start()

hs.hotkey.bind({ "ctrl" }, "1", switchWindow({ "Firefox", "Chrome" }))
hs.hotkey.bind({ "ctrl" }, "2", switchWindow({ "Obsidian" }))
hs.hotkey.bind({ "ctrl" }, "3", switchWindow({ "WezTerm" }))
hs.hotkey.bind({ "ctrl" }, "4", switchWindow({ "Microsoft Teams", "Mail" }))

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
