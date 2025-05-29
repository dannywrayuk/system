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
					{
						icon = "",
						key = "b",
						desc = "Branches",
						action = [[:lua Snacks.picker.git_branches()]],
					},
					{
						icon = "",
						key = "p",
						desc = "Pull",
						action = ":lua require('neogit').action('pull', 'from_pushremote', {})()",
					},
					{
						icon = "",
						key = "m",
						desc = "Checkout main",
						action = function()
							local mainBranch = vim.fn.trim(vim.fn.system("git main-branch"))
							print("Checking out: " .. mainBranch)
							local result = vim.fn.trim(vim.fn.system("git checkout " .. mainBranch))
							vim.print(result)
						end,
					},
					{ icon = "", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
 ▄▄    ▄   ▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄   ▄▄   ▄▄   ▄▄▄   ▄▄   ▄▄ 
█  █  █ █ █       █ █       █ █  █ █  █ █   █ █  █▄█  █
█   █▄█ █ █    ▄▄▄█ █   ▄   █ █  █▄█  █ █   █ █       █
█       █ █   █▄▄▄▄ █  █ █  █ █       █ █   █ █       █
█  ▄    █ █    ▄▄▄█ █  █▄█  █ █       █ █   █ █       █
█ █ █   █ █   █▄▄▄▄ █       █ ██     ██ █   █ █ ██▄██ █
█▄█  █▄▄█ █▄▄▄▄▄▄▄█ █▄▄▄▄▄▄▄█   █▄▄▄█   █▄▄▄█ █▄█   █▄█
                                                    btw]],
			},
		},
	},
}
