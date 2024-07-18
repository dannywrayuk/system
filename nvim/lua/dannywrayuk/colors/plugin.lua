return function(c, g, options, util)
	return {
		-- ts-rainbow
		rainbowcol1 = { fg = c.red },
		rainbowcol2 = { fg = c.yellow },
		rainbowcol3 = { fg = c.green },
		rainbowcol4 = { fg = c.teal },
		rainbowcol5 = { fg = c.blue },
		rainbowcol6 = { fg = c.magenta },
		rainbowcol7 = { fg = c.purple },

		-- ts-rainbow2 (maintained fork)
		TSRainbowRed = { fg = c.red },
		TSRainbowOrange = { fg = c.orange },
		TSRainbowYellow = { fg = c.yellow },
		TSRainbowGreen = { fg = c.green },
		TSRainbowBlue = { fg = c.blue },
		TSRainbowViolet = { fg = c.purple },
		TSRainbowCyan = { fg = c.cyan },

		-- rainbow-delimiters
		RainbowDelimiterRed = { fg = c.red },
		RainbowDelimiterOrange = { fg = c.orange },
		RainbowDelimiterYellow = { fg = c.yellow },
		RainbowDelimiterGreen = { fg = c.green },
		RainbowDelimiterBlue = { fg = c.blue },
		RainbowDelimiterViolet = { fg = c.purple },
		RainbowDelimiterCyan = { fg = c.cyan },

		-- LspTrouble
		TroubleText = { fg = c.fg_dark },
		TroubleCount = { fg = c.magenta, bg = c.fg_gutter },
		TroubleNormal = { fg = c.fg, bg = g.editor.sidebar.bg },

		-- Illuminate
		illuminatedWord = { bg = c.fg_gutter },
		illuminatedCurWord = { bg = c.fg_gutter },
		IlluminatedWordText = { bg = c.fg_gutter },
		IlluminatedWordRead = { bg = c.fg_gutter },
		IlluminatedWordWrite = { bg = c.fg_gutter },

		-- diff
		diffAdded = { fg = g.semantic.add },
		diffRemoved = { fg = g.semantic.delete },
		diffChanged = { fg = g.semantic.change },
		diffOldFile = { fg = c.yellow },
		diffNewFile = { fg = c.orange },
		diffFile = { fg = c.blue },
		diffLine = { fg = g.syntax.comment },
		diffIndexLine = { fg = c.magenta },

		-- Neogit
		NeogitBranch = { fg = c.magenta },
		NeogitRemote = { fg = c.purple },
		NeogitHunkHeader = { bg = g.bg.highlight, fg = c.fg },
		NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.blue },
		NeogitDiffContextHighlight = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
		NeogitDiffDeleteHighlight = { fg = g.semantic.delete, bg = g.semantic.delete },
		NeogitDiffAddHighlight = { fg = g.semantic.add, bg = g.semantic.add },

		-- Neotest
		NeotestPassed = { fg = c.green },
		NeotestRunning = { fg = c.yellow },
		NeotestFailed = { fg = c.red },
		NeotestSkipped = { fg = c.blue },
		NeotestTest = { fg = g.editor.sidebar.fg },
		NeotestNamespace = { fg = c.green2 },
		NeotestFocused = { fg = c.yellow },
		NeotestFile = { fg = c.teal },
		NeotestDir = { fg = c.blue },
		NeotestBorder = { fg = c.blue },
		NeotestIndent = { fg = g.editor.sidebar.fg },
		NeotestExpandMarker = { fg = g.editor.sidebar.fg },
		NeotestAdapterName = { fg = c.purple, bold = true },
		NeotestWinSelect = { fg = c.blue },
		NeotestMarked = { fg = c.blue },
		NeotestTarget = { fg = c.blue },
		--[[ NeotestUnknown = {}, ]]

		-- GitGutter
		GitGutterAdd = { fg = g.semantic.add }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = g.semantic.change }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = g.semantic.delete }, -- diff mode: Deleted line |diff.txt|
		GitGutterAddLineNr = { fg = g.semantic.add },
		GitGutterChangeLineNr = { fg = g.semantic.change },
		GitGutterDeleteLineNr = { fg = g.semantic.delete },

		-- GitSigns
		GitSignsAdd = { fg = g.semantic.add }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = g.semantic.change }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = g.semantic.delete }, -- diff mode: Deleted line |diff.txt|

		-- mini.diff
		MiniDiffSignAdd = { fg = g.semantic.add }, -- diff mode: Added line |diff.txt|
		MiniDiffSignChange = { fg = g.semantic.change }, -- diff mode: Changed line |diff.txt|
		MiniDiffSignDelete = { fg = g.semantic.delete }, -- diff mode: Deleted line |diff.txt|

		-- Telescope
		TelescopeBorder = { fg = g.fg.highlight, bg = g.editor.float.bg },
		TelescopeNormal = { fg = c.fg, bg = g.editor.float.bg },
		TelescopePromptBorder = { fg = c.orange, bg = g.editor.float.bg },
		TelescopePromptTitle = { fg = c.orange, bg = g.editor.float.bg },
		TelescopeResultsComment = { fg = c.dark3 },

		-- NvimTree
		NvimTreeNormal = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg },
		NvimTreeWinSeparator = {
			fg = options.styles.sidebars == "transparent" and g.fg.lower or g.editor.sidebar.bg,
			bg = g.editor.sidebar.bg,
		},
		NvimTreeNormalNC = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg },
		NvimTreeRootFolder = { fg = c.blue, bold = true },
		NvimTreeGitDirty = { fg = g.semantic.change },
		NvimTreeGitNew = { fg = g.semantic.add },
		NvimTreeGitDeleted = { fg = g.semantic.delete },
		NvimTreeOpenedFile = { bg = g.bg.highlight },
		NvimTreeSpecialFile = { fg = c.purple, underline = true },
		NvimTreeIndentMarker = { fg = c.fg_gutter },
		NvimTreeImageFile = { fg = g.editor.sidebar.fg },
		NvimTreeSymlink = { fg = c.blue },
		NvimTreeFolderIcon = { bg = c.none, fg = c.blue },
		-- NvimTreeFolderName= { fg = g.editor.float.fg },

		NeoTreeNormal = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg },
		NeoTreeNormalNC = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg },
		NeoTreeDimText = { fg = c.fg_gutter },

		-- Fern
		FernBranchText = { fg = c.blue },

		-- glyph palette
		GlyphPalette1 = { fg = c.red1 },
		GlyphPalette2 = { fg = c.green },
		GlyphPalette3 = { fg = c.yellow },
		GlyphPalette4 = { fg = c.blue },
		GlyphPalette6 = { fg = c.green1 },
		GlyphPalette7 = { fg = c.fg },
		GlyphPalette9 = { fg = c.red },

		-- Dashboard
		DashboardShortCut = { fg = c.cyan },
		DashboardHeader = { fg = c.blue },
		DashboardCenter = { fg = c.magenta },
		DashboardFooter = { fg = c.blue1 },
		DashboardKey = { fg = c.orange },
		DashboardDesc = { fg = c.cyan },
		DashboardIcon = { fg = c.cyan, bold = true },

		-- Alpha
		AlphaShortcut = { fg = c.orange },
		AlphaHeader = { fg = c.blue },
		AlphaHeaderLabel = { fg = c.orange },
		AlphaFooter = { fg = c.blue1 },
		AlphaButtons = { fg = c.cyan },

		-- WhichKey
		WhichKey = { fg = c.cyan },
		WhichKeyGroup = { fg = c.blue },
		WhichKeyDesc = { fg = c.magenta },
		WhichKeySeperator = { fg = g.syntax.comment },
		WhichKeySeparator = { fg = g.syntax.comment },
		WhichKeyFloat = { bg = g.editor.sidebar.bg },
		WhichKeyValue = { fg = c.dark5 },

		-- LspSaga
		DiagnosticWarning = { link = "DiagnosticWarn" },
		DiagnosticInformation = { link = "DiagnosticInfo" },

		LspFloatWinNormal = { bg = g.editor.float.bg },
		LspFloatWinBorder = { fg = g.fg.highlight },
		LspSagaBorderTitle = { fg = c.cyan },
		LspSagaHoverBorder = { fg = c.blue },
		LspSagaRenameBorder = { fg = c.green },
		LspSagaDefPreviewBorder = { fg = c.green },
		LspSagaCodeActionBorder = { fg = c.blue },
		LspSagaFinderSelection = { fg = g.bg.highlight },
		LspSagaCodeActionTitle = { fg = c.blue1 },
		LspSagaCodeActionContent = { fg = c.purple },
		LspSagaSignatureHelpBorder = { fg = c.red },
		ReferencesCount = { fg = c.purple },
		DefinitionCount = { fg = c.purple },
		DefinitionIcon = { fg = c.blue },
		ReferencesIcon = { fg = c.blue },
		TargetWord = { fg = c.cyan },

		-- NeoVim
		healthError = { fg = g.semantic.error },
		healthSuccess = { fg = c.green1 },
		healthWarning = { fg = g.semantic.warning },

		-- BufferLine
		BufferLineIndicatorSelected = { fg = g.semantic.change },

		-- Barbar
		BufferCurrent = { bg = c.bg, fg = c.fg },
		BufferCurrentERROR = { bg = c.bg, fg = g.semantic.error },
		BufferCurrentHINT = { bg = c.bg, fg = g.semantic.hint },
		-- BufferCurrentIcon = { bg = c.bg, fg = c.},
		BufferCurrentINFO = { bg = c.bg, fg = g.semantic.info },
		BufferCurrentWARN = { bg = c.bg, fg = g.semantic.warning },
		BufferCurrentIndex = { bg = c.bg, fg = g.semantic.info },
		BufferCurrentMod = { bg = c.bg, fg = g.semantic.warning },
		BufferCurrentSign = { bg = c.bg, fg = c.bg },
		BufferCurrentTarget = { bg = c.bg, fg = c.red },
		BufferAlternate = { bg = c.fg_gutter, fg = c.fg },
		BufferAlternateERROR = { bg = c.fg_gutter, fg = g.semantic.error },
		BufferAlternateHINT = { bg = c.fg_gutter, fg = g.semantic.hint },
		-- BufferAlternateIcon = { bg = c.fg_gutter, fg = c. },
		BufferAlternateIndex = { bg = c.fg_gutter, fg = g.semantic.info },
		BufferAlternateINFO = { bg = c.fg_gutter, fg = g.semantic.info },
		BufferAlternateMod = { bg = c.fg_gutter, fg = g.semantic.warning },
		BufferAlternateSign = { bg = c.fg_gutter, fg = g.semantic.info },
		BufferAlternateTarget = { bg = c.fg_gutter, fg = c.red },
		BufferAlternateWARN = { bg = c.fg_gutter, fg = g.semantic.warning },
		BufferVisible = { bg = g.editor.statusline, fg = c.fg },
		BufferVisibleERROR = { bg = g.editor.statusline, fg = g.semantic.error },
		BufferVisibleHINT = { bg = g.editor.statusline, fg = g.semantic.hint },
		-- BufferVisibleIcon = { bg = g.editor.statusline, fg = c. },
		BufferVisibleINFO = { bg = g.editor.statusline, fg = g.semantic.info },
		BufferVisibleWARN = { bg = g.editor.statusline, fg = g.semantic.warning },
		BufferVisibleIndex = { bg = g.editor.statusline, fg = g.semantic.info },
		BufferVisibleMod = { bg = g.editor.statusline, fg = g.semantic.warning },
		BufferVisibleSign = { bg = g.editor.statusline, fg = g.semantic.info },
		BufferVisibleTarget = { bg = g.editor.statusline, fg = c.red },
		BufferInactive = { bg = util.darken(g.bg.highlight, 0.4), fg = util.darken(c.dark5, 0.8) },
		BufferInactiveERROR = { bg = util.darken(g.bg.highlight, 0.4), fg = util.darken(g.semantic.error, 0.8) },
		BufferInactiveHINT = { bg = util.darken(g.bg.highlight, 0.4), fg = util.darken(g.semantic.hint, 0.8) },
		-- BufferInactiveIcon = { bg = g.editor.statusline, fg = util.darken(c., 0.1) },
		BufferInactiveINFO = { bg = util.darken(g.bg.highlight, 0.4), fg = util.darken(g.semantic.info, 0.8) },
		BufferInactiveWARN = { bg = util.darken(g.bg.highlight, 0.4), fg = util.darken(g.semantic.warning, 0.8) },
		BufferInactiveIndex = { bg = util.darken(g.bg.highlight, 0.4), fg = c.dark5 },
		BufferInactiveMod = { bg = util.darken(g.bg.highlight, 0.4), fg = util.darken(g.semantic.warning, 0.8) },
		BufferInactiveSign = { bg = util.darken(g.bg.highlight, 0.4), fg = c.bg },
		BufferInactiveTarget = { bg = util.darken(g.bg.highlight, 0.4), fg = c.red },
		BufferOffset = { bg = g.editor.statusline, fg = c.dark5 },
		BufferTabpageFill = { bg = util.darken(g.bg.highlight, 0.8), fg = c.dark5 },
		BufferTabpages = { bg = g.editor.statusline, fg = c.none },

		-- Sneak
		Sneak = { fg = g.bg.highlight, bg = c.magenta },
		SneakScope = { bg = g.bg.highlight },

		-- Hop
		HopNextKey = { fg = c.magenta2, bold = true },
		HopNextKey1 = { fg = c.blue2, bold = true },
		HopNextKey2 = { fg = util.darken(c.blue2, 0.6) },
		HopUnmatched = { fg = c.dark3 },

		TSNodeKey = { fg = c.magenta2, bold = true },
		TSNodeUnmatched = { fg = c.dark3 },

		LeapMatch = { bg = c.magenta2, fg = c.fg, bold = true },
		LeapLabelPrimary = { fg = c.magenta2, bold = true },
		LeapLabelSecondary = { fg = c.green1, bold = true },
		LeapBackdrop = { fg = c.dark3 },

		FlashBackdrop = { fg = c.dark3 },
		FlashLabel = { bg = c.magenta2, bold = true, fg = c.fg },

		LightspeedGreyWash = { fg = c.dark3 },
		-- LightspeedCursor = { link = "Cursor" },
		LightspeedLabel = { fg = c.magenta2, bold = true, underline = true },
		LightspeedLabelDistant = { fg = c.green1, bold = true, underline = true },
		LightspeedLabelDistantOverlapped = { fg = c.green2, underline = true },
		LightspeedLabelOverlapped = { fg = c.magenta2, underline = true },
		LightspeedMaskedChar = { fg = c.orange },
		LightspeedOneCharMatch = { bg = c.magenta2, fg = c.fg, bold = true },
		LightspeedPendingOpArea = { bg = c.magenta2, fg = c.fg },
		LightspeedShortcut = { bg = c.magenta2, fg = c.fg, bold = true, underline = true },
		-- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
		-- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
		LightspeedUnlabeledMatch = { fg = c.blue2, bold = true },

		-- Cmp
		CmpDocumentation = { fg = c.fg, bg = g.editor.float.bg },
		CmpDocumentationBorder = { fg = g.fg.highlight, bg = g.editor.float.bg },
		CmpGhostText = { fg = c.terminal_black },

		CmpItemAbbr = { fg = c.fg, bg = c.none },
		CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.blue1, bg = c.none },
		CmpItemAbbrMatchFuzzy = { fg = c.blue1, bg = c.none },

		CmpItemMenu = { fg = g.syntax.comment, bg = c.none },

		CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },

		NeoTreeGitModified = { fg = g.semantic.change },
		NeoTreeGitUntracked = { fg = g.semantic.add },

		CmpItemKindCodeium = { fg = c.teal, bg = c.none },
		CmpItemKindCopilot = { fg = c.teal, bg = c.none },
		CmpItemKindTabNine = { fg = c.teal, bg = c.none },

		-- headlines.nvim
		CodeBlock = { bg = c.bg_dark },

		-- navic
		NavicSeparator = { fg = c.fg, bg = c.none },
		NavicText = { fg = c.fg, bg = c.none },

		AerialNormal = { fg = c.fg, bg = c.none },
		AerialGuide = { fg = c.fg_gutter },
		AerialLine = { link = "LspInlayHint" },

		IndentBlanklineChar = { fg = c.fg_gutter, nocombine = true },
		IndentBlanklineContextChar = { fg = c.blue1, nocombine = true },
		IblIndent = { fg = c.fg_gutter, nocombine = true },
		IblScope = { fg = c.blue1, nocombine = true },
		IndentLine = { fg = c.fg_gutter, nocombine = true },
		IndentLineCurrent = { fg = c.blue1, nocombine = true },

		-- Scrollbar
		ScrollbarHandle = { fg = c.none, bg = g.bg.highlight },

		ScrollbarSearchHandle = { fg = c.orange, bg = g.bg.highlight },
		ScrollbarSearch = { fg = c.orange, bg = c.none },

		ScrollbarErrorHandle = { fg = g.semantic.error, bg = g.bg.highlight },
		ScrollbarError = { fg = g.semantic.error, bg = c.none },

		ScrollbarWarnHandle = { fg = g.semantic.warning, bg = g.bg.highlight },
		ScrollbarWarn = { fg = g.semantic.warning, bg = c.none },

		ScrollbarInfoHandle = { fg = g.semantic.info, bg = g.bg.highlight },
		ScrollbarInfo = { fg = g.semantic.info, bg = c.none },

		ScrollbarHintHandle = { fg = g.semantic.hint, bg = g.bg.highlight },
		ScrollbarHint = { fg = g.semantic.hint, bg = c.none },

		ScrollbarMiscHandle = { fg = c.purple, bg = g.bg.highlight },
		ScrollbarMisc = { fg = c.purple, bg = c.none },

		-- Yanky
		YankyPut = { link = "IncSearch" },
		YankyYanked = { link = "IncSearch" },

		-- Lazy
		LazyProgressDone = { bold = true, fg = c.magenta2 },
		LazyProgressTodo = { bold = true, fg = c.fg_gutter },

		-- Notify
		NotifyBackground = { fg = c.fg, bg = c.bg },
		--- Border
		NotifyERRORBorder = { fg = util.darken(g.semantic.error, 0.3), bg = options.transparent and c.none or c.bg },
		NotifyWARNBorder = { fg = util.darken(g.semantic.warning, 0.3), bg = options.transparent and c.none or c.bg },
		NotifyINFOBorder = { fg = util.darken(g.semantic.info, 0.3), bg = options.transparent and c.none or c.bg },
		NotifyDEBUGBorder = { fg = util.darken(g.syntax.comment, 0.3), bg = options.transparent and c.none or c.bg },
		NotifyTRACEBorder = { fg = util.darken(c.purple, 0.3), bg = options.transparent and c.none or c.bg },
		--- Icons
		NotifyERRORIcon = { fg = g.semantic.error },
		NotifyWARNIcon = { fg = g.semantic.warning },
		NotifyINFOIcon = { fg = g.semantic.info },
		NotifyDEBUGIcon = { fg = g.syntax.comment },
		NotifyTRACEIcon = { fg = c.purple },
		--- Title
		NotifyERRORTitle = { fg = g.semantic.error },
		NotifyWARNTitle = { fg = g.semantic.warning },
		NotifyINFOTitle = { fg = g.semantic.info },
		NotifyDEBUGTitle = { fg = g.syntax.comment },
		NotifyTRACETitle = { fg = c.purple },
		--- Body
		NotifyERRORBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		NotifyWARNBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		NotifyINFOBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		NotifyDEBUGBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		NotifyTRACEBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },

		-- Mini
		MiniCompletionActiveParameter = { underline = true },

		MiniCursorword = { bg = c.fg_gutter },
		MiniCursorwordCurrent = { bg = c.fg_gutter },

		MiniIndentscopeSymbol = { fg = c.blue1, nocombine = true },
		MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

		MiniJump = { bg = c.magenta2, fg = "#ffffff" },

		MiniJump2dSpot = { fg = c.magenta2, bold = true, nocombine = true },

		MiniStarterCurrent = { nocombine = true },
		MiniStarterFooter = { fg = c.yellow, italic = true },
		MiniStarterHeader = { fg = c.blue },
		MiniStarterInactive = { fg = g.syntax.comment, style = options.styles.comments },
		MiniStarterItem = { fg = c.fg, bg = options.transparent and c.none or c.bg },
		MiniStarterItemBullet = { fg = g.fg.highlight },
		MiniStarterItemPrefix = { fg = g.semantic.warning },
		MiniStarterSection = { fg = c.blue1 },
		MiniStarterQuery = { fg = g.semantic.info },

		MiniStatuslineDevinfo = { fg = c.fg_dark, bg = g.bg.highlight },
		MiniStatuslineFileinfo = { fg = c.fg_dark, bg = g.bg.highlight },
		MiniStatuslineFilename = { fg = c.fg_dark, bg = c.fg_gutter },
		MiniStatuslineInactive = { fg = c.blue, bg = g.editor.statusline },
		MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
		MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
		MiniStatuslineModeNormal = { fg = c.black, bg = c.blue, bold = true },
		MiniStatuslineModeOther = { fg = c.black, bg = c.teal, bold = true },
		MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
		MiniStatuslineModeVisual = { fg = c.black, bg = c.magenta, bold = true },

		MiniSurround = { bg = c.orange, fg = c.black },

		MiniTablineCurrent = { fg = c.fg, bg = c.fg_gutter },
		MiniTablineFill = { bg = c.black },
		MiniTablineHidden = { fg = c.dark5, bg = g.editor.statusline },
		MiniTablineModifiedCurrent = { fg = g.semantic.warning, bg = c.fg_gutter },
		MiniTablineModifiedHidden = { bg = g.editor.statusline, fg = util.darken(g.semantic.warning, 0.7) },
		MiniTablineModifiedVisible = { fg = g.semantic.warning, bg = g.editor.statusline },
		MiniTablineTabpagesection = { bg = g.editor.statusline, fg = c.none },
		MiniTablineVisible = { fg = c.fg, bg = g.editor.statusline },

		MiniTestEmphasis = { bold = true },
		MiniTestFail = { fg = c.red, bold = true },
		MiniTestPass = { fg = c.green, bold = true },

		MiniTrailspace = { bg = c.red },

		-- Noice

		NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },

		TreesitterContext = { bg = util.darken(c.fg_gutter, 0.8) },
		Hlargs = { fg = c.yellow },
	}
end
