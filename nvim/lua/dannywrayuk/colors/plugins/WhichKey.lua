return function(c, g, options, util)
	return {
		WhichKey = { fg = c.cyan },
		WhichKeyGroup = { fg = g.fg.highlight },
		WhichKeyDesc = { fg = c.magenta },
		WhichKeySeperator = { fg = g.syntax.comment },
		WhichKeySeparator = { fg = g.syntax.comment },
		WhichKeyFloat = { bg = g.bg.lower },
		WhichKeyValue = { fg = c.dark5 },
	}
end
