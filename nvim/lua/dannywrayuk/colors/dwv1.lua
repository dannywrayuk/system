local c = {
	none = "NONE",
	bg = "#1a1b26",
	bg_dark = "#16161e",
	bg_highlight = "#292e42",
	terminal_black = "#414868",
	fg = "#c0caf5",
	fg_dark = "#a9b1d6",
	fg_gutter = "#3b4261",
	dark3 = "#545c7e",
	gray = "#565f89",
	dark5 = "#737aa2",
	blue0 = "#3d59a1",
	blue = "#7aa2f7",
	cyan = "#7dcfff",
	blue1 = "#2ac3de",
	blue2 = "#0db9d7",
	blue5 = "#89ddff",
	blue6 = "#b4f9f8",
	blue7 = "#394b70",
	magenta = "#bb9af7",
	magenta2 = "#ff007c",
	purple = "#9d7cd8",
	orange = "#ff9e64",
	yellow = "#e0af68",
	green = "#9ece6a",
	green1 = "#73daca",
	green2 = "#41a6b5",
	teal = "#1abc9c",
	red = "#f7768e",
	red1 = "#db4b4b",
}

local util = require("dannywrayuk.colors.util")(c)

local options = {
	transparent = false,
	styles = {},
}

local g = {
	bg = {
		lower = util.darken(c.bg, 0.8, "#000000"),
		base = c.bg,
		upper = util.lighten(c.bg, 0.8, "#000000"),
		highlight = c.bg_highlight,
	},
	fg = {
		lower = c.fg_gutter,
		base = c.fg,
		upper = util.lighten(c.fg, 0.8, "#000000"),
		highlight = c.blue1,
	},

	editor = {
		sidebar = { fg = c.fg, bg = c.bg },
		float = { fg = c.fg, bg = c.bg },
		statusline = c.bg_dark,
	},
	syntax = {
		comment = c.gray,
		constant = c.blue,
		string = c.orange,
		character = c.green,
		number = c.yellow,
		boolean = c.blue,
		float = c.yellow,
		identifier = c.blue,
		func = c.yellow,
		statement = c.magenta,
		conditional = c.magenta,
		loop = c.magenta,
		label = c.magenta,
		operator = c.blue5,
		exception = c.magenta,
		keyword = c.magenta,
		preprocessor = c.magenta,
		type = c.orange,
		special = c.red,
		delimiter = c.fg_dark,
		brackets = c.fg_dark,
		escape = c.red,
		regex = c.yellow,
		constructor = c.yellow,
		parameter = c.blue1,
		property = c.green,
	},
	semantic = {
		error = c.red1,
		todo = c.blue,
		warning = c.yellow,
		info = c.blue2,
		hint = c.blue7,
		add = c.teal,
		delete = c.red1,
		change = c.yellow,
		ignore = c.dark3,
	},
}

local overrides = {}

return {
	colors = c,
	groups = g,
	options = options,
	overrides = overrides,
}
