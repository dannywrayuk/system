return function(c, g, options, util)
	return {
		MiniDiffSignAdd = { fg = g.semantic.add }, -- diff mode: Added line |diff.txt|
		MiniDiffSignChange = { fg = g.semantic.change }, -- diff mode: Changed line |diff.txt|
		MiniDiffSignDelete = { fg = g.semantic.delete }, -- diff mode: Deleted line |diff.txt|

		MiniCompletionActiveParameter = { underline = true },

		MiniCursorword = { bg = g.bg.lower },
		MiniCursorwordCurrent = { bg = g.bg.lower },

		MiniIndentscopeSymbol = { fg = g.fg.highlight, nocombine = true },
		MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

		MiniJump = { bg = c.magenta2, fg = "#ffffff" },

		MiniJump2dSpot = { fg = c.magenta2, bold = true, nocombine = true },

		MiniStarterCurrent = { nocombine = true },
		MiniStarterFooter = { fg = c.yellow, italic = true },
		MiniStarterHeader = { fg = g.fg.highlight },
		MiniStarterInactive = { fg = g.syntax.comment, style = options.styles.comments },
		MiniStarterItem = { fg = g.fg.base, bg = g.bg.base },
		MiniStarterItemBullet = { fg = g.fg.highlight },
		MiniStarterItemPrefix = { fg = g.semantic.warning },
		MiniStarterSection = { fg = g.fg.highlight },
		MiniStarterQuery = { fg = g.semantic.info },

		MiniStatuslineDevinfo = { fg = g.fg.lower, bg = g.bg.highlight },
		MiniStatuslineFileinfo = { fg = g.fg.lower, bg = g.bg.highlight },
		MiniStatuslineFilename = { fg = g.fg.lower, bg = g.bg.lower },
		MiniStatuslineInactive = { fg = g.fg.highlight, bg = g.editor.statusline },
		MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
		MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
		MiniStatuslineModeNormal = { fg = c.black, bg = c.blue, bold = true },
		MiniStatuslineModeOther = { fg = c.black, bg = c.teal, bold = true },
		MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
		MiniStatuslineModeVisual = { fg = c.black, bg = c.magenta, bold = true },

		MiniSurround = { bg = c.orange, fg = c.black },

		MiniTablineCurrent = { fg = g.fg.base, bg = g.bg.lower },
		MiniTablineFill = { bg = c.black },
		MiniTablineHidden = { fg = c.dark5, bg = g.editor.statusline },
		MiniTablineModifiedCurrent = { fg = g.semantic.warning, bg = g.bg.lower },
		MiniTablineModifiedHidden = { bg = g.editor.statusline, fg = util.darken(g.semantic.warning, 0.7) },
		MiniTablineModifiedVisible = { fg = g.semantic.warning, bg = g.editor.statusline },
		MiniTablineTabpagesection = { bg = g.editor.statusline },
		MiniTablineVisible = { fg = g.fg.base, bg = g.editor.statusline },

		MiniTestEmphasis = { bold = true },
		MiniTestFail = { fg = c.red, bold = true },
		MiniTestPass = { fg = c.green, bold = true },

		MiniTrailspace = { bg = c.red },
	}
end
