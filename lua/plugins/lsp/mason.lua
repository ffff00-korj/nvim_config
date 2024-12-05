local options = {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    cmd = "Mason",
    config = function()
        require("mason").setup()
        require("mason-tool-installer").setup {
            ensure_installed = {
                "pyright",
                "djlint",
                "mypy",
                "debugpy",
                "ruff",
                "ruff-lsp",

                "gopls",
                "gofumpt",
                "goimports",
                "goimports-reviser",
                "golines",
                "delve",

                "json-lsp",
                "yaml-language-server",

                "html-lsp",
                "css-lsp",
                "typescript-language-server",

                "lua-language-server",
                "stylua",
            },
        }
    end
}

return options
