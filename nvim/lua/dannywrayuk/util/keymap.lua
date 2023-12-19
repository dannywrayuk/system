local apply = require("dannywrayuk.util.apply")
local keymap = {}

local defaultOps = { silent = true, noremap = true }

keymap.set = function(mode, key, map, opts)
	if opts ~= nil then
		vim.keymap.set(mode, key, map, apply(opts, apply(defaultOps, {})))
	else
		vim.keymap.set(mode, key, map, defaultOps)
	end
end

return keymap
