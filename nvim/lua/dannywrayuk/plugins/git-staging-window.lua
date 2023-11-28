return {
    dir = "git-staging-window",
    config = function()
        local gsw = require("git-staging-window")
        gsw.setup({})
        vim.keymap.set("n", "<leader>z", gsw.openWindow)
    end
}