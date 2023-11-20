vim.cmd("colorscheme darkplus")
require('darkplus.palette')

vim.api.nvim_set_hl(0, '@keyword.export', { link="@keyword.operator" })
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly', { link="Constant" })

vim.api.nvim_set_hl(0, "MsgArea", { fg="#c6c6c6",  bg="#080808" })
