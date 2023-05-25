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

            local allow_format = { 'lua_ls', 'python' }
            if vim.tbl_contains(allow_format, client.name) then
                require('lsp-format').on_attach(client)
            end
            lsp.buffer_autoformat()
        end)
        require('plugins.lsp.sign-icons')
        require('plugins.lsp.lsp-config')
        lsp.setup()
        require('plugins.lsp.cmp')
    end
}
