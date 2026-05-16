require("core.options")
require("notes.options")
require("lazy-bootstrap")({
		{
			import = "core.plugins",
		},
		{ import =  "notes.plugins"},
	})

vim.cmd([[colorscheme catppuccin]])
