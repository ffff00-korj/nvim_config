local cmp = require('cmp')

cmp.setup({
    window = {
        documentation = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
        }),
        completion = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
        }),
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = require('lspkind').cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    }
})

cmp.setup({
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
    end
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
        { name = "dap" },
    },
})
