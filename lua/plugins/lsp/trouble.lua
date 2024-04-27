local options = {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        signs = {
            error = "E",
            warning = "W",
            hint = "H",
            information = "I"
        },
    },
    keys = {
        { "<leader>pt", "<cmd>TroubleToggle<CR>", { desc = "[p]rocess [t]roubles" } }
    },
}

return options
