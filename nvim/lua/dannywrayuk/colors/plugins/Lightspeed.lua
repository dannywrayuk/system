return function(c, g, options, util)
	return {
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
	}
end
