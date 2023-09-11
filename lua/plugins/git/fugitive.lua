local options = {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gs",  vim.cmd.Git },
        { "<leader>gpp", "<cmd>Git push<CR>" },
    },
}

return options
