vim.cmd("cd ~/Notes")
local utils = require("core.utils")

vim.api.nvim_create_user_command("FromTemplate", function(opts)
	local templateName = opts.fargs[1]
	local templatePath = "Templates/" .. templateName .. ".md"
	local fileName = opts.fargs[2] or vim.fn.input("File name: ", "", "file")
	if not templatePath then
		print("No template name provided.")
		return
	end

	local today = utils.today()
	local templateContent = utils.readFile(templatePath)
	if not templateContent then
		print("Template file not found: " .. templatePath)
		return
	end

	local newFilePath = vim.fn.fnamemodify(templateName, ":h") .. "/" .. fileName .. ".md"
	if vim.fn.filereadable(newFilePath) == 1 then
		print("File already exists: " .. newFilePath)
		return
	end

	templateContent = templateContent:gsub("$filename", vim.fn.fnamemodify(fileName, ":t:r"))
	templateContent = templateContent:gsub("$today", today)

	utils.writeFile(newFilePath, templateContent)

	vim.cmd("edit " .. newFilePath)
end, {
	nargs = "*",
	desc = "Create a new file from a template",
})

vim.api.nvim_create_user_command("Today", function()
	vim.cmd("FromTemplate daily Daily/" .. utils.today())
end, {})

vim.api.nvim_create_user_command("NewTemplate", require("notes.pickers").newTemplate, {})

vim.keymap.set("n", "<leader>d", function()
	local today = utils.today()
	vim.api.nvim_put({ today }, "c", true, true)
end, { noremap = true, silent = true })
