local options = {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        signs = require("plugins.icons.trouble-icons"),
    },
    keys = {
        { "<leader>pt", "<cmd>TroubleToggle<CR>" }
    },
}

return options
