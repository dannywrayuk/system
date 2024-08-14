return function(c, g, options, util)
	local highlights = {
		Comment = { fg = g.syntax.comment }, -- any comment
		Constant = { fg = g.syntax.constant }, -- (preferred) any constant
		String = { fg = g.syntax.string }, --   a string constant: "this is a string"
		Character = { fg = g.syntax.character }, --  a character constant: 'c', '\n'
		Number = { fg = g.syntax.number }, --   a number constant: 234, 0xff
		Boolean = { fg = g.syntax.boolean }, --  a boolean constant: TRUE, false
		Float = { fg = g.syntax.float }, --    a floating point constant: 2.3e10

		Identifier = { fg = g.syntax.identifier }, -- (preferred) any variable name
		Function = { fg = g.syntax.func }, -- function name (also: methods for classes)

		Statement = { fg = g.syntax.statement }, -- (preferred) any statement
		Conditional = { fg = g.syntax.conditional }, --  if, then, else, endif, switch, etc.
		Repeat = { fg = g.syntax.loop }, --   for, do, while, etc.
		Label = { fg = g.syntax.label }, --    case, default, etc.
		Operator = { fg = g.syntax.operator }, -- "sizeof", "+", "*", etc.
		Exception = { fg = g.syntax.exception }, --  try, catch, throw
		Keyword = { fg = g.syntax.keyword }, --  any other keyword

		PreProc = { fg = g.syntax.preprocessor }, -- (preferred) generic Preprocessor
		-- Include       = { }, --  preprocessor #include
		-- Define        = { }, --   preprocessor #define
		-- Macro         = { }, --    same as Define
		-- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

		Type = { fg = g.syntax.type }, -- (preferred) int, long, char, etc.
		-- StorageClass  = { }, -- static, register, volatile, etc.
		-- Structure     = { }, --  struct, union, enum, etc.
		-- Typedef       = { }, --  A typedef

		Special = { fg = g.syntax.special }, -- (preferred) any special symbol
		-- SpecialChar   = { }, --  special character in a constant
		-- Tag           = { }, --    you can use CTRL-] on this
		Delimiter = { fg = g.syntax.delimiter }, --  character that needs attention
		-- SpecialComment= { }, -- special things inside a comment

		Debug = { fg = g.semantic.warning }, --    debugging statements
		Error = { fg = g.semantic.error }, -- (preferred) any erroneous construct
		Todo = { fg = g.semantic.hint }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- ("Ignore", below, may be invisible...)
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

		-- These groups are for the Neovim tree-sitter highlights.
		["@annotation"] = { link = "PreProc" },
		["@attribute"] = { link = "PreProc" },
		["@boolean"] = { link = "Boolean" },
		["@constructor"] = { fg = g.syntax.constructor }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },
		["@comment"] = { link = "Comment" },
		["@keyword.conditional"] = { link = "Conditional" },
		["@operator"] = { link = "Operator" },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Special" },
		["@constant.macro"] = { link = "Define" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.directive.define"] = { link = "Define" },
		["@keyword.exception"] = { link = "Exception" },
		["@number.float"] = { link = "Float" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Special" },
		["@function.call"] = { link = "@function" },
		["@function.macro"] = { link = "Macro" },
		["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
		["@keyword.function"] = { link = "Function" }, -- For keywords used to define a fuction.
		["@keyword.import"] = { link = "Include" },
		["@keyword.coroutine"] = { link = "@keyword" },
		["@keyword.operator"] = { link = "@operator" },
		["@keyword.return"] = { link = "@keyword" },
		["@label"] = { link = "Label" }, -- For labels: `label:` in C and `:label:` in Lua.
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "@function.method" },
		["@namespace.builtin"] = { link = "@variable.builtin" },
		["@none"] = {},
		["@number"] = { link = "Number" },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.storage"] = { link = "StorageClass" },
		["@string"] = { link = "String" },
		["@tag"] = { link = "Label" },
		["@tag.attribute"] = { link = "@property" },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@module"] = { link = "Include" },
		["@comment.note"] = { fg = g.semantic.hint },
		["@comment.error"] = { fg = g.semantic.error },
		["@comment.hint"] = { fg = g.semantic.hint },
		["@comment.info"] = { fg = g.semantic.info },
		["@comment.warning"] = { fg = g.semantic.warning },
		["@comment.todo"] = { fg = g.semantic.todo },
		-- ["@comment.documentation"] = { },
		["@type"] = { link = "Type" },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "@keyword" },
		["@punctuation.delimiter"] = { link = "Delimiter" }, -- For delimiters ie: `.`
		["@punctuation.bracket"] = { fg = g.syntax.brackets }, -- For brackets and parens.
		["@punctuation.special"] = { link = "Special" }, -- For special symbols (e.g. `{}` in string interpolation)
		["@string.documentation"] = { fg = g.semantic.info },
		["@string.regexp"] = { fg = g.syntax.regex }, -- For regexes.
		["@string.escape"] = { fg = g.syntax.escape }, -- For escape characters within a string.
		["@variable.parameter"] = { fg = g.syntax.parameter }, -- For parameters of a function.
		["@variable.parameter.builtin"] = { fg = util.lighten(g.syntax.parameter, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
		["@type.builtin"] = { fg = util.darken(g.syntax.type, 0.8) },
		["@variable.member"] = { link = "Identifier" }, -- For fields.
		["@property"] = { fg = g.syntax.property },
		["@variable"] = { link = "Identifier" }, -- Any variable name that does not have another highlight.
		["@variable.builtin"] = { link = "Keyword" }, -- Variable names that are defined by the languages, like `this` or `self`.
		["@module.builtin"] = { link = "Keyword" }, -- Variable names that are defined by the languages, like `this` or `self`.
		-- tsx
		["@tag.tsx"] = { link = "Keyword" }, -- built in tag
		["@constructor.tsx"] = { link = "Type" }, -- component tag
		["@tag.delimiter.tsx"] = { link = "Delimiter" },

		-- LSP Semantic Token Groups
		["@lsp.type.boolean"] = { link = "@boolean" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.decorator"] = { link = "@attribute" },
		["@lsp.type.deriveHelper"] = { link = "@attribute" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
		["@lsp.type.generic"] = { link = "@variable" },
		["@lsp.type.interface"] = { link = "Type" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.lifetime"] = { link = "@keyword.storage" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.typeAlias"] = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"] = { undercurl = true, sp = g.semantic.error },
		["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		-- ["@lsp.typemod.variable.globalScope"] = {} -- global variables
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.typeAlias.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.variable.callable"] = { link = "@function" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
		["@lsp.typemod.variable.static"] = { link = "@constant" },
		["@lsp.type.namespace.python"] = { link = "@variable" },

		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true }, -- (preferred) any bold text
		Italic = { italic = true }, -- (preferred) any italic text

		qfFileName = { fg = g.fg.highlight },

		htmlH1 = { fg = g.markdown.h1, bold = true },
		htmlH2 = { fg = g.markdown.h2, bold = true },

		--- Text
		["@markup"] = { link = "@none" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "Type" },
		["@markup.raw"] = { link = "String" },
		["@markup.math"] = { link = "Special" },
		["@markup.strong"] = { bold = true },
		["@markup.emphasis"] = { italic = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { link = "Title" },
		["@markup.raw.markdown_inline"] = { bg = g.bg.upper },
		["@markup.link"] = { fg = g.markdown.link },
		["@markup.link.label"] = { link = "SpecialChar" },
		["@markup.link.label.symbol"] = { link = "Identifier" },
		["@markup.link.url"] = { link = "Underlined" },

		["@markup.list.unchecked"] = { fg = g.markdown.unchecked }, -- For brackets and parens.
		["@markup.list.checked"] = { fg = g.markdown.checked }, -- For brackets and parens.
		["@markup.list"] = { fg = g.markdown.list }, -- For special punctutation that does not fall in the catagories before.

		["@diff.plus"] = { link = "DiffAdd" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.delta"] = { link = "DiffChange" },
		["helpCommand"] = { fg = g.fg.highlight },

		debugPC = { bg = g.editor.sidebar.bg }, -- used for highlighting the current line in terminal-debug
		debugBreakpoint = { bg = util.darken(g.semantic.info, 0.1), fg = g.semantic.info }, -- used for breakpoint colors in terminal-debug

		dosIniLabel = { link = "@property" },

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { bg = g.fg.lower }, -- used for highlighting "text" references
		LspReferenceRead = { bg = g.fg.lower }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = g.fg.lower }, -- used for highlighting "write" references

		DiagnosticError = { fg = g.semantic.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = g.semantic.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = g.semantic.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = g.semantic.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticUnnecessary = { fg = g.semantic.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticVirtualTextError = { bg = util.darken(g.semantic.error, 0.1), fg = g.semantic.error }, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = { bg = util.darken(g.semantic.warning, 0.1), fg = g.semantic.warning }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = { bg = util.darken(g.semantic.info, 0.1), fg = g.semantic.info }, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = { bg = util.darken(g.semantic.hint, 0.1), fg = g.semantic.hint }, -- Used for "Hint" diagnostic virtual text

		DiagnosticUnderlineError = { undercurl = true, sp = g.semantic.error }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { undercurl = true, sp = g.semantic.warning }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { undercurl = true, sp = g.semantic.info }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { undercurl = true, sp = g.semantic.hint }, -- Used to underline "Hint" diagnostics

		LspSignatureActiveParameter = { bg = util.darken(g.bg.highlight, 0.4), bold = true },
		LspCodeLens = { fg = g.syntax.comment },
		LspInlayHint = { bg = util.darken(g.semantic.hint, 0.1), fg = g.semantic.hint },

		LspInfoBorder = { fg = g.fg.highlight, bg = g.editor.float.bg },

		ALEErrorSign = { fg = g.semantic.error },
		ALEWarningSign = { fg = g.semantic.warning },

		DapStoppedLine = { bg = util.darken(g.semantic.warning, 0.1) }, -- Used for "Warning" diagnostic virtual text
	}
	local kinds = {
		Array = "@punctuation.bracket",
		Boolean = "@boolean",
		Class = "@type",
		Color = "Special",
		Constant = "@constant",
		Constructor = "@constructor",
		Enum = "@lsp.type.enum",
		EnumMember = "@lsp.type.enumMember",
		Event = "Special",
		Field = "@variable.member",
		File = "Normal",
		Folder = "Directory",
		Function = "@function",
		Interface = "@lsp.type.interface",
		Key = "@variable.member",
		Keyword = "@lsp.type.keyword",
		Method = "@function.method",
		Module = "@module",
		Namespace = "@module",
		Null = "@constant.builtin",
		Number = "@number",
		Object = "@constant",
		Operator = "@operator",
		Package = "@module",
		Property = "@property",
		Reference = "@markup.link",
		Snippet = "Conceal",
		String = "@string",
		Struct = "@lsp.type.struct",
		Unit = "@lsp.type.struct",
		Text = "@markup",
		TypeParameter = "@lsp.type.typeParameter",
		Variable = "@variable",
		Value = "@string",
	}

	local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }
	for kind, link in pairs(kinds) do
		local base = "LspKind" .. kind
		highlights[base] = { link = link }
		for _, plugin in pairs(kind_groups) do
			highlights[plugin:format(kind)] = { link = base }
		end
	end

	local markdown_rainbow = {
		g.rainbow.a,
		g.rainbow.b,
		g.rainbow.c,
		g.rainbow.d,
		g.rainbow.e,
		g.rainbow.f,
		g.rainbow.g,
	}

	for i, color in ipairs(markdown_rainbow) do
		highlights["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
		highlights["Headline" .. i] = { bg = util.darken(color, 0.05) }
	end
	highlights["Headline"] = { link = "Headline1" }

	local severity_map = {
		Error = "Error",
		Warn = "Warning",
		Info = "Information",
		Hint = "Hint",
	}
	local types = { "Default", "VirtualText", "Underline" }
	for _, type in ipairs(types) do
		for snew, sold in pairs(severity_map) do
			highlights["LspDiagnostics" .. type .. sold] = {
				link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
			}
		end
	end
	return highlights
end
