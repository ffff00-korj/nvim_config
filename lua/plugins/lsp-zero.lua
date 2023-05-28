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
        { 'rcarriga/cmp-dap' },
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
