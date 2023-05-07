return {
    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'lewis6991/gitsigns.nvim',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'lukas-reineke/indent-blankline.nvim',
    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        name = 'gruvbox',
        config = function()
            vim.cmd.colorscheme('gruvbox')
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        },
    },
    'nvim-treesitter/nvim-treesitter',
    {
        'VonHeikemen/lsp-zero.nvim',
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
    },
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'romgrk/barbar.nvim',
        dependencies = 'nvim-web-devicons'
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            lazy = true
        }
    },
    {
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({})
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'mfussenegger/nvim-dap-python',
        },
    },
}
