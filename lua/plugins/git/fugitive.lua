local options = {
    'tpope/vim-fugitive',
    keys = {
        { '<leader>gs', vim.cmd.Git },
        { '<leader>gp', '<cmd>Git push<CR>' },
    },
}

return options
