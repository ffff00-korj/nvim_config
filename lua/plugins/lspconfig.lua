local opts = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
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
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        lspconfig.lua_ls.setup {capabilities = capabilities}
        lspconfig.pyright.setup {capabilities = capabilities}
        lspconfig.ruff.setup {capabilities = capabilities}

        ---@diagnostic disable: missing-fields
        vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format() end, { desc = "Format current buffer" })
        ---@diagnostic enable: missing-fields
    end,
}

return opts
