return function(c, g, options, util)
	return {
		NeotestPassed = { fg = g.semantic.good },
		NeotestRunning = { fg = g.semantic.loading },
		NeotestFailed = { fg = g.semantic.bad },
		NeotestSkipped = { fg = g.semantic.ignore },
		NeotestTest = { fg = g.fg.lower },
		NeotestNamespace = { fg = g.fg.highlight },
		NeotestFocused = { fg = g.fg.highlight },
		NeotestFile = { fg = g.fg.highlight },
		NeotestDir = { fg = g.fg.highlight },
		NeotestBorder = { fg = g.editor.border },
		NeotestIndent = { fg = g.fg.highlight },
		NeotestExpandMarker = { fg = g.fg.highlight },
		NeotestAdapterName = { fg = g.fg.highlight, bold = true },
		NeotestWinSelect = { fg = g.fg.highlight },
		NeotestMarked = { fg = g.fg.highlight },
		NeotestTarget = { fg = g.fg.highlight },
		--[[ NeotestUnknown = {}, ]]
	}
end
