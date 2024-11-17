return function(c, g, options, util)
	return {
		TelescopeBorder = { fg = g.editor.border, bg = g.bg.lower },
		TelescopeNormal = { fg = g.fg.base, bg = g.bg.lower },
		TelescopePromptBorder = { fg = g.editor.border, bg = g.bg.lower },
		TelescopePromptTitle = { fg = g.fg.highlight, bg = g.bg.lower },
		TelescopeResultsComment = { fg = g.fg.lower },
	}
end
