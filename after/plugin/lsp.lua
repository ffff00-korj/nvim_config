local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.on_attach(function()
    lsp.buffer_autoformat()
end)

lsp.setup()

vim.diagnostic.config({virtual_text = true,})
