return function(c, g, options, util)
	return {
		FlashBackdrop = { fg = g.fg.lower },
		FlashLabel = { bg = c.magenta2, bold = true, fg = g.fg.base },
	}
end
