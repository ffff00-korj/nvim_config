local options = {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    enabled = true,
    lazy = false,
    keys = {
        { "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global [n]eovim [m]inimap" },
        { "<leader>nr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global [n]eovim [m]inimap" },
    },
    init = function()
        vim.opt.wrap = false
        vim.opt.sidescrolloff = 36

        vim.g.neominimap = {
            auto_enable = true,
            exclude_filetypes = {
                "help",
                "netrw",
            },
        }
    end,
}

return options
