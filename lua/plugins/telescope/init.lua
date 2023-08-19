local config = {
    'nvim-telescope/telescope.nvim',
    lazy = false,
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
        local utils = require("telescope.utils")

        vim.keymap.set('n', '<leader>pf', function() builtin.find_files({ cwd = utils.buffer_dir() }) end, {})
        vim.keymap.set('n', '<leader>pg', function() builtin.git_files({ cwd = utils.buffer_dir() }) end, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input('Grep > ')
            });
        end)
    end,
}

return config
