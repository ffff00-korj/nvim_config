require("lspconfig").pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                flake8 = {enabled = true,},
                pycodestyle = {enabled = false,},
                mccabe = {enabled = false,},
                pyflakes = {enabled = false,},
            },
        },
    },
}
