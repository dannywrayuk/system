return function(c, g, options, util)
	return {
		HopNextKey = { fg = c.magenta2, bold = true },
		HopNextKey1 = { fg = g.fg.highlight, bold = true },
		HopNextKey2 = { fg = util.darken(c.blue2, 0.6) },
		HopUnmatched = { fg = g.fg.lower },
	}
end
