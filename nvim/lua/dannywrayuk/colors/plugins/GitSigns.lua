return function(c, g, options, util)
	return {
		GitSignsAdd = { fg = g.semantic.add }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = g.semantic.change }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = g.semantic.delete }, -- diff mode: Deleted line |diff.txt|
	}
end
