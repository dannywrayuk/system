return function(c, g, options, util)
	return {
		ColorColumn = { bg = g.bg.lower }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = g.fg.highlight }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		CursorColumn = { bg = g.bg.highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = g.bg.highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = g.markdown.title }, -- directory names (and other special names in listings)
		DiffAdd = { bg = g.semantic.add }, -- diff mode: Added line |diff.txt|
		DiffChange = { bg = g.semantic.change }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = g.semantic.delete }, -- diff mode: Deleted line |diff.txt|
		DiffText = { bg = g.bg.highlight }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = g.bg.lower }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor  = { }, -- cursor in a focused terminal
		-- TermCursorNC= { }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = g.semantic.error }, -- error messages on the command line
		VertSplit = { fg = g.editor.divider }, -- the column separating vertically split windows
		WinSeparator = { fg = g.editor.divider, bg = g.bg.lower, bold = true }, -- the column separating vertically split windows
		Folded = { fg = g.fg.highlight, bg = g.bg.highlight }, -- line used for closed folds
		FoldColumn = { bg = g.bg.base, fg = g.fg.lower }, -- 'foldcolumn'
		SignColumn = { bg = g.bg.base, fg = g.fg.lower }, -- column where |signs| are displayed
		SignColumnSB = { bg = g.bg.lower, fg = g.fg.lower }, -- column where |signs| are displayed
		Substitute = { bg = g.semantic.change }, -- |:substitute| replacement text highlighting
		LineNr = { fg = g.fg.lower }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = g.fg.highlight, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		LineNrAbove = { fg = g.fg.lower },
		LineNrBelow = { fg = g.fg.lower },
		MatchParen = { fg = g.fg.highlight, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = g.fg.highlight, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = g.fg.base }, -- Area for messages and cmdline
		-- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = g.semantic.info }, -- |more-prompt|
		NonText = { fg = g.fg.lower }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = g.fg.base, bg = g.bg.base }, -- normal text
		NormalNC = { fg = g.fg.base, bg = g.bg.lower }, -- normal text in non-current windows
		NormalSB = { fg = g.fg.base, bg = g.bg.lower }, -- normal text in sidebar
		NormalFloat = { fg = g.fg.base, bg = g.bg.lower }, -- Normal text in floating windows.
		FloatBorder = { fg = g.editor.border, bg = g.bg.lower },
		FloatTitle = { fg = g.fg.highlight, bg = g.bg.lower },
		Pmenu = { bg = g.bg.base, fg = g.fg.base }, -- Popup menu: normal item.
		PmenuSel = { bg = util.darken(g.fg.lower, 0.8) }, -- Popup menu: selected item.
		PmenuSbar = { bg = util.lighten(g.bg.base, 0.95) }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = g.fg.lower }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = g.semantic.info }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = g.bg.highlight, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = g.bg.highlight }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = g.bg.upper }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { link = "IncSearch" },
		SpecialKey = { fg = g.semantic.warning }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = g.semantic.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = g.semantic.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = g.semantic.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = g.semantic.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = g.fg.base, bg = g.editor.statusline }, -- status line of current window
		StatusLineNC = { fg = g.fg.lower, bg = g.editor.statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = g.editor.statusline, fg = g.fg.lower }, -- tab pages line, not active tab page label
		TabLineFill = { bg = g.bg.lower }, -- tab pages line, where there are no labels
		TabLineSel = { fg = g.fg.highlight, bg = g.bg.base }, -- tab pages line, active tab page label
		Title = { fg = g.markdown.h1 }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = g.bg.highlight }, -- Visual mode selection
		VisualNOS = { bg = g.bg.highlight }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = g.semantic.warning }, -- warning messages
		Whitespace = { fg = g.fg.lower }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = g.bg.highlight }, -- current match in 'wildmenu' completion
		WinBar = { link = "StatusLine" }, -- window bar
		WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows
	}
end
