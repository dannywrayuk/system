return function(c, g, options, util)
	return {
		DiagnosticWarning = { link = "DiagnosticWarn" },
		DiagnosticInformation = { link = "DiagnosticInfo" },

		LspFloatWinNormal = { bg = g.bg.lower },
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
	}
end
