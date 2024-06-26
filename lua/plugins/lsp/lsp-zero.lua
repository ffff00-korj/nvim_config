local options = {
    "VonHeikemen/lsp-zero.nvim",
    lazy = false,
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "lukas-reineke/lsp-format.nvim" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lua" },
        { "rcarriga/cmp-dap" },
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
        { "onsails/lspkind-nvim" },
    },
    config = function()
        local lsp = require("lsp-zero")

        lsp.preset("recommended")
        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)
        lsp.set_sign_icons()

        require("plugins.lsp.lspconfig")
        lsp.setup()
        require("plugins.lsp.cmp")
    end
}

return options
