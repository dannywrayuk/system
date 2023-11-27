local builtin = require('telescope.builtin')
require("telescope").setup({
    defaults= {
        results_title = false,
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top"
        },
        mappings = {
            i = {
                ['<C-p>'] = require('telescope.actions.layout').toggle_preview
            }
        },
        preview = {
            hide_on_startup = true
        }
    }
})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', function ()
    builtin.buffers({ sort_mru = true, ignore_current_buffer = true  })
end)
vim.keymap.set('n', '<leader>fb', builtin.git_branches)
vim.keymap.set('n', '<leader>fc', builtin.git_commits)

