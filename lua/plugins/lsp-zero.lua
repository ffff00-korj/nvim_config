return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'lukas-reineke/lsp-format.nvim' },
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
    keys = {
        { '<leader>f', function() vim.lsp.buf.format { async = true } end },
        { '<space>e',  vim.diagnostic.open_float },
        { '[d',        vim.diagnostic.goto_prev },
        { ']d',        vim.diagnostic.goto_next },
        { '<space>q',  vim.diagnostic.setloclist },
        { 'gD',        vim.lsp.buf.declaration },
        { 'gd',        vim.lsp.buf.definition },
        { 'K',         vim.lsp.buf.hover },
        { 'gi',        vim.lsp.buf.implementation },
        { '<C-k>',     vim.lsp.buf.signature_help },
        { '<space>wa', vim.lsp.buf.add_workspace_folder },
        { '<space>wr', vim.lsp.buf.remove_workspace_folder },
        { '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end },
        { '<space>D',  vim.lsp.buf.type_definition },
        { '<space>rn', vim.lsp.buf.rename },
        { 'gr',        vim.lsp.buf.references },

    },
    config = function()
        local lsp = require('lsp-zero')
        lsp.preset('recommended')

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })

            local allow_format = { 'lua_ls', 'rust_analyzer', 'python' }
            if vim.tbl_contains(allow_format, client.name) then
                require('lsp-format').on_attach(client)
            end
        end)

        lsp.set_sign_icons({
            error = '',
            warning = '',
            hint = '',
            information = '',
            other = '﫠',
        })


        -- lsp config lsp's
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

        -- lsp setup
        lsp.setup()


        local cmp = require('cmp')

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
