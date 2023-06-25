local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
    capabilities = capabilities,
}

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            configurationSources = { 'flake8' },
            plugins = {
                flake8 = { enabled = true, },
                pycodestyle = { enabled = false, },
                mccabe = { enabled = false, },
                pyflakes = { enabled = false, },
            },
        },
    },
}
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}
