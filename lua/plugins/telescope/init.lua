return {
    'nvim-telescope/telescope.nvim',
    name = 'telescope-plugin',
    dependencies = {
        { 'nvim-lua/plenary.nvim' }
    },
    opts = function()
        return require('plugins.telescope.chad_config')
    end,
    config = function(_, opts)
        require('telescope').setup(opts)

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input('Grep > ')
            });
        end)
    end,
}
