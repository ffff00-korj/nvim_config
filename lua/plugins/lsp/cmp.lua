local cmp = require("cmp")

cmp.setup({
    window = {
        documentation = cmp.config.window.bordered({
            winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
            border = "single", -- single|rounded|none
        }),
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
            border = "single", -- single|rounded|none
        }),
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "vim-dadbod-completion" },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
        })
    }
})
