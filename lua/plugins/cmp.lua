local opts = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "onsails/lspkind-nvim",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            window = {
                documentation = cmp.config.window.bordered({
                    winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
                    border = "rounded", -- single|rounded|none
                }),
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
                    border = "rounded", -- single|rounded|none
                }),
            },
            mapping = {
                ["<down>"] = cmp.mapping.select_next_item(),
                ["<up>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = {
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = require("lspkind").cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
                expandable_indicator = false,
            }
        })
    end,
}

return opts
