return function()
	local branch = string.gsub(vim.fn.system("git branch --show-current"), "\n", "")
	if branch == "" then
		return nil
	end
	return branch
end
