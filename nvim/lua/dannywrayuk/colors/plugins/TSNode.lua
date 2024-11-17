return function(c, g, options, util)
	return {
		TSNodeKey = { fg = c.magenta2, bold = true },
		TSNodeUnmatched = { fg = g.fg.lower },
	}
end
