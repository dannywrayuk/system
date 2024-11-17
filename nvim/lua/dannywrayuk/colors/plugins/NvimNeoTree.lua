return function(c, g, options, util)
	return {
		NvimTreeNormal = { fg = g.fg.base, bg = g.bg.lower },
		NvimTreeWinSeparator = {
			fg = g.editor.border,
		},
		NvimTreeNormalNC = { bg = g.bg.lower },
		NvimTreeRootFolder = { fg = g.fg.highlight, bold = true },
		NvimTreeGitDirty = { fg = g.semantic.change },
		NvimTreeGitNew = { fg = g.semantic.add },
		NvimTreeGitDeleted = { fg = g.semantic.delete },
		NvimTreeOpenedFile = { bg = g.bg.highlight },
		NvimTreeSpecialFile = { fg = g.fg.highlight, underline = true },
		NvimTreeIndentMarker = { fg = g.bg.lower },
		NvimTreeImageFile = { fg = g.fg.base },
		NvimTreeSymlink = { fg = g.fg.highlight },
		NvimTreeFolderIcon = { fg = g.fg.highlight },
		NvimTreeFolderName = { fg = g.fg.highlight },

		NeoTreeNormal = { fg = g.fg.base, bg = g.bg.lower },
		NeoTreeNormalNC = { fg = g.fg.base, bg = g.bg.lower },
		NeoTreeDimText = { fg = g.bg.lower },
	}
end
