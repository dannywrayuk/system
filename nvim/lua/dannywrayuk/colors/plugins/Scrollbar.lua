return function(c, g, options, util)
	return {
		ScrollbarHandle = { bg = g.bg.highlight },

		ScrollbarSearchHandle = { fg = c.orange, bg = g.bg.highlight },
		ScrollbarSearch = { fg = c.orange },

		ScrollbarErrorHandle = { fg = g.semantic.error, bg = g.bg.highlight },
		ScrollbarError = { fg = g.semantic.error },

		ScrollbarWarnHandle = { fg = g.semantic.warning, bg = g.bg.highlight },
		ScrollbarWarn = { fg = g.semantic.warning },

		ScrollbarInfoHandle = { fg = g.semantic.info, bg = g.bg.highlight },
		ScrollbarInfo = { fg = g.semantic.info },

		ScrollbarHintHandle = { fg = g.semantic.hint, bg = g.bg.highlight },
		ScrollbarHint = { fg = g.semantic.hint },

		ScrollbarMiscHandle = { fg = c.purple, bg = g.bg.highlight },
		ScrollbarMisc = { fg = c.purple },
	}
end
