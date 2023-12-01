return {
	"stevearc/dressing.nvim",
	config = function()
		local dressing = require("dressing")
		dressing.setup({
			input = {
				relative = "editor",
			},
		})
	end,
}
