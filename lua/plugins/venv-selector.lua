local options = {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function()
        require('venv-selector').setup({
            notify_user_on_activate = false,
        })
        vim.keymap.set("n", "<leader>vf", "<cmd>:VenvSelect<cr>")
        vim.keymap.set("n", "<leader>vs", "<cmd>:VenvSelectCached<cr>")
    end,
}

return options
