vim.api.nvim_create_user_command("NewfilePrompt", function ()
    vim.ui.input({prompt = "filename"}, function (input)
        if input == nil then return end
        local trimmed = input:gsub("%s+","")
        if trimmed == "" then return end
        if trimmed:sub(-1) == "/" then
            vim.cmd('silent !mkdir -p '.. trimmed)
        else
            vim.cmd('edit ' .. trimmed)
            vim.cmd('!mkdir -p "%:h"')
            vim.cmd('w')
        end
    end)
end, {})