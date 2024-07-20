local options = {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function()
        require('venv-selector').setup({
            notify_user_on_activate = false,
            stay_on_this_version = true,
        })
        vim.keymap.set("n", "<leader>vf", "<cmd>:VenvSelect<cr>", { desc = "open menu to open [v]env" })
        vim.keymap.set("n", "<leader>vs", "<cmd>:VenvSelectCached<cr>", { desc = "select [v]env from cache" })
    end,
}

return options
