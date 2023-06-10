return {
    'nvim-telescope/telescope.nvim',
    name = 'telescope-plugin',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'mfussenegger/nvim-dap' },
        { 'nvim-treesitter/nvim-treesitter' },
        { 'rcarriga/nvim-dap-ui' }
    },
    keys = {
        { "<leader><leader>", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
        { "<leader>sb",       "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    },
    opts = function()
        return require('plugins.telescope.chad_config')
    end,
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('dap')
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
