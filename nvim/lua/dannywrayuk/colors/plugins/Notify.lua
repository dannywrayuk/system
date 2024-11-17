return function(c, g, options, util)
	return {
		NotifyBackground = { fg = g.fg.base, bg = g.bg.base },
		NotifyERRORBorder = {
			fg = util.darken(g.semantic.error, 0.3),
			bg = options.transparent and c.none or g.bg.base,
		},
		NotifyWARNBorder = {
			fg = util.darken(g.semantic.warning, 0.3),
			bg = options.transparent and c.none or g.bg.base,
		},
		NotifyINFOBorder = { fg = util.darken(g.semantic.info, 0.3), bg = options.transparent and c.none or g.bg.base },
		NotifyDEBUGBorder = {
			fg = util.darken(g.syntax.comment, 0.3),
			bg = options.transparent and c.none or g.bg.base,
		},
		NotifyTRACEBorder = { fg = util.darken(c.purple, 0.3), bg = options.transparent and c.none or g.bg.base },

		NotifyERRORIcon = { fg = g.semantic.error },
		NotifyWARNIcon = { fg = g.semantic.warning },
		NotifyINFOIcon = { fg = g.semantic.info },
		NotifyDEBUGIcon = { fg = g.syntax.comment },
		NotifyTRACEIcon = { fg = c.purple },

		NotifyERRORTitle = { fg = g.semantic.error },
		NotifyWARNTitle = { fg = g.semantic.warning },
		NotifyINFOTitle = { fg = g.semantic.info },
		NotifyDEBUGTitle = { fg = g.syntax.comment },
		NotifyTRACETitle = { fg = c.purple },

		NotifyERRORBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
		NotifyWARNBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
		NotifyINFOBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
		NotifyDEBUGBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
		NotifyTRACEBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
	}
end
