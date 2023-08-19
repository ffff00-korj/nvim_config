return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
        ensure_installed = {
            'pyright',
            'json-lsp',
            'html-lsp',
            'css-lsp',
            'lua-language-server',
            'yaml-language-server',

            'black',
            'isort',
            'djlint',
            'flake8',
            'pyflakes',
            'stylua',

            'debugpy',
        },
    },
}
