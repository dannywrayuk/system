return function(c, g, options, util)
	return {
		AerialNormal = { fg = g.fg.base },
		AerialGuide = { fg = g.bg.lower },
		AerialLine = { link = "LspInlayHint" },
	}
end
