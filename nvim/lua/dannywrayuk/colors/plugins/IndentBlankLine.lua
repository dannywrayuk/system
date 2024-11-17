return function(c, g, options, util)
	return {
		IndentBlanklineChar = { fg = g.bg.lower, nocombine = true },
		IndentBlanklineContextChar = { fg = g.fg.highlight, nocombine = true },
		IblIndent = { fg = g.bg.lower, nocombine = true },
		IblScope = { fg = g.fg.highlight, nocombine = true },
		IndentLine = { fg = g.bg.lower, nocombine = true },
		IndentLineCurrent = { fg = g.fg.highlight, nocombine = true },
	}
end
