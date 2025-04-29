return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "recent_files", cwd = true, padding = 2 },
				{ section = "keys", padding = 2, gap = 1 },
				{ section = "startup" },
			},
			preset = {
				keys = {
					{
						icon = "",
						key = "b",
						desc = "Branches",
						action = [[:lua Snacks.picker.git_branches({all=true,win={input={keys={["<S-CR>"]={"git_branch_add",mode={"i"}}}}}})]],
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
