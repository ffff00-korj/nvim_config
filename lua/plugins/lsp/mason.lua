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

            "json-lsp",
            "yaml-language-server",

            "html-lsp",
            "css-lsp",
            "tsserver",

            "lua-language-server",
            "stylua",
        },
        automatic_installation = true,
    },
}

return options
