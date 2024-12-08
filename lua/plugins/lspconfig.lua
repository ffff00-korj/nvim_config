local opts = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "folke/lazydev.nvim",
            ft = "lua", -- file type
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {}
        lspconfig.pyright.setup {}
        lspconfig.ruff.setup {}

        vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format() end, { desc = "Format current buffer" })
    end,
}

return opts
