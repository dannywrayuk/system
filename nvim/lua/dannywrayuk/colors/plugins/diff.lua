return function(c, g, options, util)
	return {
		diffAdded = { fg = g.semantic.add },
		diffRemoved = { fg = g.semantic.delete },
		diffChanged = { fg = g.semantic.change },
		diffOldFile = { fg = g.semantic.delete },
		diffNewFile = { fg = g.semantic.add },
		diffFile = { fg = g.fg.highlight },
		diffLine = { fg = g.syntax.comment },
		diffIndexLine = { fg = g.fg.highlight },
	}
end
