return function(c, g, options, util)
	return {
		NeogitBranch = { fg = g.fg.highlight },
		NeogitRemote = { fg = g.fg.highlight },
		NeogitHunkHeader = { bg = g.bg.highlight, fg = g.fg.base },
		NeogitHunkHeaderHighlight = { bg = g.bg.lower, fg = g.fg.highlight },
		NeogitDiffContextHighlight = { bg = util.darken(g.bg.lower, 0.5), fg = g.fg.lower },
		NeogitDiffDeleteHighlight = { bg = g.semantic.delete },
		NeogitDiffAddHighlight = { bg = g.semantic.add },
	}
end
