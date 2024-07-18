local namespace = "dannywrayuk.colors."
local get_compiled_path = function(themeName)
	return table.concat({ vim.fn.stdpath("state"), "theme", themeName .. "_compiled.lua" }, "/")
end

local function join(firstTable, secondTable)
	if firstTable == nil or secondTable == nil then
		return
	end
	for k, v in pairs(secondTable) do
		firstTable[k] = v
	end
end

local loadCompiled = function(themeName)
	local f = loadfile(get_compiled_path(themeName))
	if f then
		f()
		return true
	end
	return false
end

local compile = function(themeName)
	local inspect = vim.inspect
	vim.loop.fs_mkdir(vim.fn.stdpath("state") .. "/theme", 448)

	local theme = require(namespace .. themeName)
	local util = require(namespace .. "util")(theme.colors, theme.groups, theme.options)

	local highlights = {}
	join(highlights, require(namespace .. "core")(theme.colors, theme.groups, theme.options, util))
	join(highlights, require(namespace .. "syntax")(theme.colors, theme.groups, theme.options, util))
	join(highlights, require(namespace .. "plugin")(theme.colors, theme.groups, theme.options, util))
	join(highlights, theme.overrides)

	local fname = get_compiled_path(themeName)
	local file, err = io.open(fname, "wb")
	if not file or err then
		vim.notify("Error writing " .. fname .. ":\n" .. err, vim.log.levels.ERROR)
		return
	end

	local lines = {
		"local h = vim.api.nvim_set_hl",
	}
	for hl, spec in pairs(highlights) do
		table.insert(lines, ('h(0, "%s", %s)'):format(hl, inspect(spec):gsub("%s", "")))
	end

	local blob = table.concat(lines, "\n")
	file:write(blob)
	file:close()
end

return {
	load = function(themeName)
		vim.api.nvim_create_user_command("BuildColors", function()
			package.loaded[namespace .. themeName] = nil
			package.loaded[namespace .. "core"] = nil
			package.loaded[namespace .. "syntax"] = nil
			package.loaded[namespace .. "plugin"] = nil
			compile(themeName)
			vim.cmd("colorscheme " .. themeName)
		end, {})
		if loadCompiled(themeName) then
		else
			compile(themeName)
			loadCompiled(themeName)
		end
	end,
}
