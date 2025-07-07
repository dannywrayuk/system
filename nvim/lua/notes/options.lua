vim.cmd("cd ~/Notes")

vim.api.nvim_create_user_command("Today", function()
	print("Today's date is: " .. os.date("%Y-%m-%d"))
end, {})
