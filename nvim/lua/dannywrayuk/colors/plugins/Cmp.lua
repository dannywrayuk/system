return function(c, g, options, util)
	return {
		CmpDocumentation = { fg = g.fg.base, bg = g.bg.lower },
		CmpDocumentationBorder = { fg = g.editor.border, bg = g.bg.lower },
		CmpGhostText = { fg = c.terminal_black },

		CmpItemAbbr = { fg = g.fg.base },
		CmpItemAbbrDeprecated = { fg = g.bg.lower, strikethrough = true },
		CmpItemAbbrMatch = { fg = g.fg.highlight },
		CmpItemAbbrMatchFuzzy = { fg = g.fg.highlight },

		CmpItemMenu = { fg = g.syntax.comment },

		CmpItemKindDefault = { fg = g.fg.lower },

		NeoTreeGitModified = { fg = g.semantic.change },
		NeoTreeGitUntracked = { fg = g.semantic.add },

		CmpItemKindCodeium = { fg = c.teal },
		CmpItemKindCopilot = { fg = c.teal },
		CmpItemKindTabNine = { fg = c.teal },
	}
end
