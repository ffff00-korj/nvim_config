local options = {
    "leoluz/nvim-dap-go",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    ft = "go",
    config = function()
        require("dap-go").setup()

        vim.keymap.set("n", "<leader><leader>Dgt", function()
            require("dap-go").debug_test()
        end, {
            desc = "[D]ebug [g]o [t]ests",
        })
    end,
}

return options
