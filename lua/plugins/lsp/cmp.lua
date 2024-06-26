local cmp = require("cmp")

cmp.setup({
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
    end,
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

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
        { name = "dap" },
    },
})
