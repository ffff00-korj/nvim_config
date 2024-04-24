local options = {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gs", vim.cmd.Git,         { desc = "[g]it [s]tatus" } },
        { "<leader>gp", "<cmd>Git push<CR>", { desc = "[g]it [p]ush" } },
    },
}

return options
