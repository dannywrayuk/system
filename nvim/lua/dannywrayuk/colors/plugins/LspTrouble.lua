return function(c, g, options, util)
	return {
		TroubleText = { fg = g.fg.lower },
		TroubleCount = { fg = g.semantic.info },
		TroubleNormal = { fg = g.fg.base, bg = g.bg.lower },
	}
end
