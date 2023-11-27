local mason_tool_installer = require("mason-tool-installer")

mason_tool_installer.setup({
    ensure_installed = {
        "prettier", -- prettier formatter
        "stylua",   -- lua formatter
        "eslint_d", -- js linter
    },
})
