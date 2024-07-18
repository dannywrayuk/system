return function(c, g, options, util)
	return {
		ColorColumn = { bg = g.bg.lower }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = c.dark5 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
		lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = g.bg.highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = g.bg.highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = c.blue }, -- directory names (and other special names in listings)
		DiffAdd = { bg = g.semantic.add }, -- diff mode: Added line |diff.txt|
		DiffChange = { bg = g.semantic.change }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = g.semantic.delete }, -- diff mode: Deleted line |diff.txt|
		DiffText = { bg = g.bg.highlight }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor  = { }, -- cursor in a focused terminal
		-- TermCursorNC= { }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = g.semantic.error }, -- error messages on the command line
		VertSplit = { fg = g.fg.lower }, -- the column separating vertically split windows
		WinSeparator = { fg = g.fg.lower, bold = true }, -- the column separating vertically split windows
		Folded = { fg = c.blue, bg = c.fg_gutter }, -- line used for closed folds
		FoldColumn = { bg = options.transparent and c.none or c.bg, fg = g.syntax.comment }, -- 'foldcolumn'
		SignColumn = { bg = options.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
		SignColumnSB = { bg = g.editor.sidebar.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
		Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
		LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = c.orange, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		LineNrAbove = { fg = c.fg_gutter },
		LineNrBelow = { fg = c.fg_gutter },
		MatchParen = { fg = c.orange, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = c.fg_dark, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { fg = c.fg_dark }, -- Area for messages and cmdline
		-- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = c.blue }, -- |more-prompt|
		NonText = { fg = c.dark3 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- normal text
		NormalNC = { fg = c.fg, bg = options.transparent and c.none or options.dim_inactive and c.bg_dark or c.bg }, -- normal text in non-current windows
		NormalSB = { fg = g.editor.sidebar.fg, bg = g.editor.sidebar.bg }, -- normal text in sidebar
		NormalFloat = { fg = g.editor.float.fg, bg = g.editor.float.bg }, -- Normal text in floating windows.
		FloatBorder = { fg = g.fg.highlight, bg = g.editor.float.bg },
		FloatTitle = { fg = g.fg.highlight, bg = g.editor.float.bg },
		Pmenu = { bg = g.bg.base, fg = c.fg }, -- Popup menu: normal item.
		PmenuSel = { bg = util.darken(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
		PmenuSbar = { bg = util.lighten(g.bg.base, 0.95) }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = g.bg.highlight, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = g.bg.highlight }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { bg = c.orange, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { link = "IncSearch" },
		SpecialKey = { fg = c.dark3 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = g.semantic.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = g.semantic.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = g.semantic.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = g.semantic.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = g.editor.sidebar.fg, bg = g.editor.statusline }, -- status line of current window
		StatusLineNC = { fg = c.fg_gutter, bg = g.editor.statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = g.editor.statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
		TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
		TabLineSel = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label
		Title = { fg = c.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = g.bg.highlight }, -- Visual mode selection
		VisualNOS = { bg = g.bg.highlight }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = g.semantic.warning }, -- warning messages
		Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = g.bg.highlight }, -- current match in 'wildmenu' completion
		WinBar = { link = "StatusLine" }, -- window bar
		WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows
	}
end
