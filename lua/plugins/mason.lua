return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
        ensure_installed = {
            'pylsp',
            'json-lsp',
            'lua-language-server',
            'yaml-language-server',

            'black',
            'djlint',
            'flake8',
            'pyflakes',

            'debugpy',
        },
    },
}
