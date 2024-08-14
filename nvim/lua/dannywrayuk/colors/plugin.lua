return function(c, g, options, util)
	return {
		-- ts-rainbow
		rainbowcol1 = { fg = g.rainbow.a },
		rainbowcol2 = { fg = g.rainbow.b },
		rainbowcol3 = { fg = g.rainbow.c },
		rainbowcol4 = { fg = g.rainbow.d },
		rainbowcol5 = { fg = g.rainbow.e },
		rainbowcol6 = { fg = g.rainbow.f },
		rainbowcol7 = { fg = g.rainbow.g },

		-- ts-rainbow2 (maintained fork)
		TSRainbowRed = { fg = g.rainbow.a },
		TSRainbowOrange = { fg = g.rainbow.b },
		TSRainbowYellow = { fg = g.rainbow.c },
		TSRainbowGreen = { fg = g.rainbow.d },
		TSRainbowBlue = { fg = g.rainbow.e },
		TSRainbowViolet = { fg = g.rainbow.f },
		TSRainbowCyan = { fg = g.rainbow.g },

		-- rainbow-delimiters
		RainbowDelimiterRed = { fg = g.rainbow.a },
		RainbowDelimiterOrange = { fg = g.rainbow.b },
		RainbowDelimiterYellow = { fg = g.rainbow.c },
		RainbowDelimiterGreen = { fg = g.rainbow.d },
		RainbowDelimiterBlue = { fg = g.rainbow.e },
		RainbowDelimiterViolet = { fg = g.rainbow.f },
		RainbowDelimiterCyan = { fg = g.rainbow.g },

		-- LspTrouble
		TroubleText = { fg = g.fg.lower },
		TroubleCount = { fg = g.semantic.info },
		TroubleNormal = { fg = g.fg.base, bg = g.editor.sidebar.bg },

		-- Illuminate
		illuminatedWord = { bg = g.bg.lower },
		illuminatedCurWord = { bg = g.bg.lower },
		IlluminatedWordText = { bg = g.bg.lower },
		IlluminatedWordRead = { bg = g.bg.lower },
		IlluminatedWordWrite = { bg = g.bg.lower },

		-- diff
		diffAdded = { fg = g.semantic.add },
		diffRemoved = { fg = g.semantic.delete },
		diffChanged = { fg = g.semantic.change },
		diffOldFile = { fg = g.semantic.delete },
		diffNewFile = { fg = g.semantic.add },
		diffFile = { fg = g.fg.highlight },
		diffLine = { fg = g.syntax.comment },
		diffIndexLine = { fg = g.fg.highlight },

		-- Neogit
		NeogitBranch = { fg = g.fg.highlight },
		NeogitRemote = { fg = g.fg.highlight },
		NeogitHunkHeader = { bg = g.bg.highlight, fg = g.fg.base },
		NeogitHunkHeaderHighlight = { bg = g.bg.lower, fg = g.fg.highlight },
		NeogitDiffContextHighlight = { bg = util.darken(g.bg.lower, 0.5), fg = g.fg.lower },
		NeogitDiffDeleteHighlight = { bg = g.semantic.delete },
		NeogitDiffAddHighlight = { bg = g.semantic.add },

		-- Neotest
		NeotestPassed = { fg = g.semantic.good },
		NeotestRunning = { fg = g.semantic.loading },
		NeotestFailed = { fg = g.semantic.bad },
		NeotestSkipped = { fg = g.semantic.ignore },
		NeotestTest = { fg = g.editor.sidebar.fg },
		NeotestNamespace = { fg = g.fg.highlight },
		NeotestFocused = { fg = g.fg.highlight },
		NeotestFile = { fg = g.fg.highlight },
		NeotestDir = { fg = g.fg.highlight },
		NeotestBorder = { fg = g.fg.highlight },
		NeotestIndent = { fg = g.editor.sidebar.fg },
		NeotestExpandMarker = { fg = g.editor.sidebar.fg },
		NeotestAdapterName = { fg = g.fg.highlight, bold = true },
		NeotestWinSelect = { fg = g.fg.highlight },
		NeotestMarked = { fg = g.fg.highlight },
		NeotestTarget = { fg = g.fg.highlight },
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
		TelescopeNormal = { fg = g.fg.base, bg = g.editor.float.bg },
		TelescopePromptBorder = { fg = g.fg.highlight, bg = g.editor.float.bg },
		TelescopePromptTitle = { fg = g.fg.highlight, bg = g.editor.float.bg },
		TelescopeResultsComment = { fg = g.fg.lower },

		-- NvimTree
		NvimTreeNormal = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg },
		NvimTreeWinSeparator = {
			fg = options.styles.sidebars == "transparent" and g.fg.lower or g.editor.sidebar.bg,
			bg = g.editor.sidebar.bg,
		},
		NvimTreeNormalNC = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg },
		NvimTreeRootFolder = { fg = g.fg.highlight, bold = true },
		NvimTreeGitDirty = { fg = g.semantic.change },
		NvimTreeGitNew = { fg = g.semantic.add },
		NvimTreeGitDeleted = { fg = g.semantic.delete },
		NvimTreeOpenedFile = { bg = g.bg.highlight },
		NvimTreeSpecialFile = { fg = g.fg.highlight, underline = true },
		NvimTreeIndentMarker = { fg = g.bg.lower },
		NvimTreeImageFile = { fg = g.editor.sidebar.fg },
		NvimTreeSymlink = { fg = g.fg.highlight },
		NvimTreeFolderIcon = { fg = g.fg.highlight },
		-- NvimTreeFolderName= { fg = g.editor.float.fg },

		NeoTreeNormal = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg },
		NeoTreeNormalNC = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg },
		NeoTreeDimText = { fg = g.bg.lower },

		-- Fern
		FernBranchText = { fg = g.fg.highlight },

		-- glyph palette
		GlyphPalette1 = { fg = c.red1 },
		GlyphPalette2 = { fg = c.green },
		GlyphPalette3 = { fg = c.yellow },
		GlyphPalette4 = { fg = g.fg.highlight },
		GlyphPalette6 = { fg = c.green1 },
		GlyphPalette7 = { fg = g.fg.base },
		GlyphPalette9 = { fg = c.red },

		-- Dashboard
		DashboardShortCut = { fg = c.cyan },
		DashboardHeader = { fg = g.fg.highlight },
		DashboardCenter = { fg = c.magenta },
		DashboardFooter = { fg = g.fg.highlight },
		DashboardKey = { fg = c.orange },
		DashboardDesc = { fg = c.cyan },
		DashboardIcon = { fg = c.cyan, bold = true },

		-- Alpha
		AlphaShortcut = { fg = c.orange },
		AlphaHeader = { fg = g.fg.highlight },
		AlphaHeaderLabel = { fg = c.orange },
		AlphaFooter = { fg = g.fg.highlight },
		AlphaButtons = { fg = c.cyan },

		-- WhichKey
		WhichKey = { fg = c.cyan },
		WhichKeyGroup = { fg = g.fg.highlight },
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
		LspSagaHoverBorder = { fg = g.fg.highlight },
		LspSagaRenameBorder = { fg = c.green },
		LspSagaDefPreviewBorder = { fg = c.green },
		LspSagaCodeActionBorder = { fg = g.fg.highlight },
		LspSagaFinderSelection = { fg = g.bg.highlight },
		LspSagaCodeActionTitle = { fg = g.fg.highlight },
		LspSagaCodeActionContent = { fg = c.purple },
		LspSagaSignatureHelpBorder = { fg = c.red },
		ReferencesCount = { fg = c.purple },
		DefinitionCount = { fg = c.purple },
		DefinitionIcon = { fg = g.fg.highlight },
		ReferencesIcon = { fg = g.fg.highlight },
		TargetWord = { fg = c.cyan },

		-- NeoVim
		healthError = { fg = g.semantic.error },
		healthSuccess = { fg = c.green1 },
		healthWarning = { fg = g.semantic.warning },

		-- BufferLine
		BufferLineIndicatorSelected = { fg = g.semantic.change },

		-- Barbar
		BufferCurrent = { bg = g.bg.base, fg = g.fg.base },
		BufferCurrentERROR = { bg = g.bg.base, fg = g.semantic.error },
		BufferCurrentHINT = { bg = g.bg.base, fg = g.semantic.hint },
		-- BufferCurrentIcon = { bg = g.bg.base, fg = c.},
		BufferCurrentINFO = { bg = g.bg.base, fg = g.semantic.info },
		BufferCurrentWARN = { bg = g.bg.base, fg = g.semantic.warning },
		BufferCurrentIndex = { bg = g.bg.base, fg = g.semantic.info },
		BufferCurrentMod = { bg = g.bg.base, fg = g.semantic.warning },
		BufferCurrentSign = { bg = g.bg.base, fg = g.fg.base },
		BufferCurrentTarget = { bg = g.bg.base, fg = c.red },
		BufferAlternate = { bg = g.bg.lower, fg = g.fg.base },
		BufferAlternateERROR = { bg = g.bg.lower, fg = g.semantic.error },
		BufferAlternateHINT = { bg = g.bg.lower, fg = g.semantic.hint },
		-- BufferAlternateIcon = { bg = g.bg.lower, fg = c. },
		BufferAlternateIndex = { bg = g.bg.lower, fg = g.semantic.info },
		BufferAlternateINFO = { bg = g.bg.lower, fg = g.semantic.info },
		BufferAlternateMod = { bg = g.bg.lower, fg = g.semantic.warning },
		BufferAlternateSign = { bg = g.bg.lower, fg = g.semantic.info },
		BufferAlternateTarget = { bg = g.bg.lower, fg = c.red },
		BufferAlternateWARN = { bg = g.bg.lower, fg = g.semantic.warning },
		BufferVisible = { bg = g.editor.statusline, fg = g.fg.base },
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
		BufferInactiveSign = { bg = util.darken(g.bg.highlight, 0.4), fg = g.bg.base },
		BufferInactiveTarget = { bg = util.darken(g.bg.highlight, 0.4), fg = c.red },
		BufferOffset = { bg = g.editor.statusline, fg = c.dark5 },
		BufferTabpageFill = { bg = util.darken(g.bg.highlight, 0.8), fg = c.dark5 },
		BufferTabpages = { bg = g.editor.statusline },

		-- Sneak
		Sneak = { fg = g.bg.highlight, bg = c.magenta },
		SneakScope = { bg = g.bg.highlight },

		-- Hop
		HopNextKey = { fg = c.magenta2, bold = true },
		HopNextKey1 = { fg = g.fg.highlight, bold = true },
		HopNextKey2 = { fg = util.darken(c.blue2, 0.6) },
		HopUnmatched = { fg = g.fg.lower },

		TSNodeKey = { fg = c.magenta2, bold = true },
		TSNodeUnmatched = { fg = g.fg.lower },

		LeapMatch = { bg = c.magenta2, fg = g.fg.base, bold = true },
		LeapLabelPrimary = { fg = c.magenta2, bold = true },
		LeapLabelSecondary = { fg = c.green1, bold = true },
		LeapBackdrop = { fg = g.fg.lower },

		FlashBackdrop = { fg = g.fg.lower },
		FlashLabel = { bg = c.magenta2, bold = true, fg = g.fg.base },

		LightspeedGreyWash = { fg = g.fg.lower },
		-- LightspeedCursor = { link = "Cursor" },
		LightspeedLabel = { fg = c.magenta2, bold = true, underline = true },
		LightspeedLabelDistant = { fg = c.green1, bold = true, underline = true },
		LightspeedLabelDistantOverlapped = { fg = c.green2, underline = true },
		LightspeedLabelOverlapped = { fg = c.magenta2, underline = true },
		LightspeedMaskedChar = { fg = c.orange },
		LightspeedOneCharMatch = { bg = c.magenta2, fg = g.fg.base, bold = true },
		LightspeedPendingOpArea = { bg = c.magenta2, fg = g.fg.base },
		LightspeedShortcut = { bg = c.magenta2, fg = g.fg.base, bold = true, underline = true },
		-- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
		-- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
		LightspeedUnlabeledMatch = { fg = g.fg.highlight, bold = true },

		-- Cmp
		CmpDocumentation = { fg = g.fg.base, bg = g.editor.float.bg },
		CmpDocumentationBorder = { fg = g.fg.highlight, bg = g.editor.float.bg },
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

		-- headlines.nvim
		CodeBlock = { bg = g.bg.base },

		-- navic
		NavicSeparator = { fg = g.fg.base },
		NavicText = { fg = g.fg.base },

		AerialNormal = { fg = g.fg.base },
		AerialGuide = { fg = g.bg.lower },
		AerialLine = { link = "LspInlayHint" },

		IndentBlanklineChar = { fg = g.bg.lower, nocombine = true },
		IndentBlanklineContextChar = { fg = g.fg.highlight, nocombine = true },
		IblIndent = { fg = g.bg.lower, nocombine = true },
		IblScope = { fg = g.fg.highlight, nocombine = true },
		IndentLine = { fg = g.bg.lower, nocombine = true },
		IndentLineCurrent = { fg = g.fg.highlight, nocombine = true },

		-- Scrollbar
		ScrollbarHandle = { bg = g.bg.highlight },

		ScrollbarSearchHandle = { fg = c.orange, bg = g.bg.highlight },
		ScrollbarSearch = { fg = c.orange },

		ScrollbarErrorHandle = { fg = g.semantic.error, bg = g.bg.highlight },
		ScrollbarError = { fg = g.semantic.error },

		ScrollbarWarnHandle = { fg = g.semantic.warning, bg = g.bg.highlight },
		ScrollbarWarn = { fg = g.semantic.warning },

		ScrollbarInfoHandle = { fg = g.semantic.info, bg = g.bg.highlight },
		ScrollbarInfo = { fg = g.semantic.info },

		ScrollbarHintHandle = { fg = g.semantic.hint, bg = g.bg.highlight },
		ScrollbarHint = { fg = g.semantic.hint },

		ScrollbarMiscHandle = { fg = c.purple, bg = g.bg.highlight },
		ScrollbarMisc = { fg = c.purple },

		-- Yanky
		YankyPut = { link = "IncSearch" },
		YankyYanked = { link = "IncSearch" },

		-- Lazy
		LazyProgressDone = { bold = true, fg = c.magenta2 },
		LazyProgressTodo = { bold = true, fg = g.bg.lower },

		-- Notify
		NotifyBackground = { fg = g.fg.base, bg = g.bg.base },
		--- Border
		NotifyERRORBorder = {
			fg = util.darken(g.semantic.error, 0.3),
			bg = options.transparent and c.none or g.bg.base,
		},
		NotifyWARNBorder = {
			fg = util.darken(g.semantic.warning, 0.3),
			bg = options.transparent and c.none or g.bg.base,
		},
		NotifyINFOBorder = { fg = util.darken(g.semantic.info, 0.3), bg = options.transparent and c.none or g.bg.base },
		NotifyDEBUGBorder = {
			fg = util.darken(g.syntax.comment, 0.3),
			bg = options.transparent and c.none or g.bg.base,
		},
		NotifyTRACEBorder = { fg = util.darken(c.purple, 0.3), bg = options.transparent and c.none or g.bg.base },
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
		NotifyERRORBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
		NotifyWARNBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
		NotifyINFOBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
		NotifyDEBUGBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },
		NotifyTRACEBody = { fg = g.fg.base, bg = options.transparent and c.none or g.bg.base },

		-- Mini
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

		-- Noice

		NoiceCompletionItemKindDefault = { fg = g.fg.lower },

		TreesitterContext = { bg = util.darken(g.bg.lower, 0.8) },
		Hlargs = { fg = c.yellow },
	}
end
