local cmp = require("cmp")

cmp.setup({
    window = {
        documentation = cmp.config.window.bordered({
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None"
        }),
        completion = cmp.config.window.bordered({
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None"
        }),
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
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
