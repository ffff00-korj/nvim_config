local options = {
    "mbbill/undotree",
    event = "VeryLazy",
    keys = {
        { "<leader>u", vim.cmd.UndotreeToggle },
    },
}

return options
