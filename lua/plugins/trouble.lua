local opts = {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = "Trouble",
    opts = {
        signs = {
            error = "E",
            warning = "W",
            hint = "H",
            information = "I"
        },
    },
    keys = {
        { "<leader>pt", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "[p]rocess [t]roubles" } }
    },
}

return opts
