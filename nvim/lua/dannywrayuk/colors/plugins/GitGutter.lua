return function(c, g, options, util)
	return {
		GitGutterAdd = { fg = g.semantic.add }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = g.semantic.change }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = g.semantic.delete }, -- diff mode: Deleted line |diff.txt|
		GitGutterAddLineNr = { fg = g.semantic.add },
		GitGutterChangeLineNr = { fg = g.semantic.change },
		GitGutterDeleteLineNr = { fg = g.semantic.delete },
	}
end
