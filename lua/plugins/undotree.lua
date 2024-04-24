local options = {
    "mbbill/undotree",
    event = "VeryLazy",
    keys = {
        { "<leader>u", vim.cmd.UndotreeToggle, { desc = "[u]ndo tree toggle" } },
    },
}

return options
