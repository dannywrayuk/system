return {
	"folke/snacks.nvim",
	config = {
		dashboard = {
			enabled = true,
			formats = {
				file = function(item, ctx)
					local fname = vim.fn.fnamemodify(item.file, ":.")
					fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
					if #fname > ctx.width then
						local dir = vim.fn.fnamemodify(fname, ":h")
						local file = vim.fn.fnamemodify(fname, ":t")
						if dir and file then
							file = file:sub(-(ctx.width - #dir - 2))
							fname = dir .. "/…" .. file
						end
					end
					local dir, file = fname:match("^(.*)/(.+)$")
					return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
				end,
			},
			sections = {
				{ section = "header" },
				{ section = "recent_files", padding = 2, cwd = true },
				{ section = "keys", padding = 2, gap = 1 },
				{ section = "startup" },
			},
			preset = {
				keys = {
					{ icon = "", key = "t", desc = "Today", action = ":Today" },
					{ icon = "", key = "n", desc = "New", action = ":NewTemplate" },
					{ icon = "", key = "g", desc = "Tags", action = ":SearchTags" },
					{ icon = "", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
 ▄▄    ▄   ▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄ 
█  █  █ █ █       █ █       █ █       █ █       █
█   █▄█ █ █   ▄   █ █▄     ▄█ █    ▄▄▄█ █  ▄▄▄▄▄█
█       █ █  █ █  █   █   █   █   █▄▄▄▄ █ █▄▄▄▄▄ 
█  ▄    █ █  █▄█  █   █   █   █    ▄▄▄█ █▄▄▄▄▄  █
█ █ █   █ █       █   █   █   █   █▄▄▄▄ ▄▄▄▄▄▄█ █
█▄█  █▄▄█ █▄▄▄▄▄▄▄█   █▄▄▄█   █▄▄▄▄▄▄▄█ █▄▄▄▄▄▄▄█

        ]],
			},
		},
	},
}
