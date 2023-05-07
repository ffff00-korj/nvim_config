return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
        { 'onsails/lspkind-nvim' },
    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset('recommended')

        lsp.on_attach(function()
            lsp.buffer_autoformat()
        end)

        vim.diagnostic.config({ virtual_text = true, })

        local lspconfig = require('lspconfig')
        lspconfig.pylsp.setup {
            settings = {
                pylsp = {
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
        lsp.setup()

        local cmp = require('cmp')
        cmp.setup({
            window = {
                completion = {
                    autocomplete = false,
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                },
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = { 'abbr', 'kind', 'menu' },
                format = require('lspkind').cmp_format({
                    mode = 'symbol',
                    maxwidth = 50,
                    ellipsis_char = '...',
                })
            }
        })
    end
}
