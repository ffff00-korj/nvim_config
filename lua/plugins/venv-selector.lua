local opts = {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    ft = "python",
    config = function()
        require('venv-selector').setup({
            notify_user_on_activate = false,
            stay_on_this_version = true,
        })
        vim.keymap.set("n", "<leader>vf", "<cmd>:VenvSelect<cr>", { desc = "Open menu to open [v]env" })
        vim.keymap.set("n", "<leader>vs", "<cmd>:VenvSelectCached<cr>", { desc = "Select [v]env from cache" })

        -- Try to get venv from cache when plugin setup. Maybe some autocmd is needed, but these current setup works
        require("venv-selector").retrieve_from_cache()
    end,
}

return opts
