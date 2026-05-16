require("core.options")
require("dev.options")
require("lazy-bootstrap")({
		{
			import = "core.plugins",
		},
		{ import =  "dev.plugins"},
	})


vim.cmd([[colorscheme catppuccin]])
