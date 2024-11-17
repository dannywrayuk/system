return function(c, g, options, util)
	return {
		DashboardShortCut = { fg = c.cyan },
		DashboardHeader = { fg = g.fg.highlight },
		DashboardCenter = { fg = c.magenta },
		DashboardFooter = { fg = g.fg.highlight },
		DashboardKey = { fg = c.orange },
		DashboardDesc = { fg = c.cyan },
		DashboardIcon = { fg = c.cyan, bold = true },
	}
end
