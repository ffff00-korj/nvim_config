local options = {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
        ensure_installed = {
            "pyright",
            "black",
            "isort",
            "djlint",
            "flake8",
            "mypy",
            "pyflakes",
            "debugpy",

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
        automatic_installation = true,
    },
}

return options
