return function(c, g, options, util)
	return {
		healthError = { fg = g.semantic.error },
		healthSuccess = { fg = c.green1 },
		healthWarning = { fg = g.semantic.warning },
	}
end
