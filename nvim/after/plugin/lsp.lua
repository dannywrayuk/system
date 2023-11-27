local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')

local ifVisible = function(action)
    return function(fallback)
        if cmp.visible() then
            action()
        end
        fallback()
    end
end

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  ['<C-l>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<Up>'] = ifVisible(cmp.close),
  ['<Down>'] = ifVisible(cmp.close),
  ['<Left>'] = ifVisible(cmp.close),
  ['<Right>'] = ifVisible(cmp.close),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {}
})

lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}
  -- Go to definition|
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  -- Symbol information 
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

  -- Show full diagnostic message
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

  -- Show Code actions
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

  -- Find references
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)

  -- Rename symbol
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
