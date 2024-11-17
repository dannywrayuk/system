return function(c, g, options, util)
	return {
		LeapMatch = { bg = c.magenta2, fg = g.fg.base, bold = true },
		LeapLabelPrimary = { fg = c.magenta2, bold = true },
		LeapLabelSecondary = { fg = c.green1, bold = true },
		LeapBackdrop = { fg = g.fg.lower },
	}
end
