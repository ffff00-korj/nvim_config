return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.laststatus = 3 -- Or 3 for global statusline
        vim.opt.statusline = " %f %m %= %l:%c "
        require('rose-pine').setup({
            variant = 'main',
            dark_variant = 'main',
            highlight_groups = {
                ColorColumn = { bg = 'grey' },
                CursorLine = { bg = 'foam', blend = 10 },
                StatusLine = { fg = 'love', bg = 'love', blend = 10 },
                StatusLineNC = { fg = "subtle", bg = "surface" },
                TelescopeBorder = { fg = "highlight_high", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "base" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "text", bg = "base" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
            },
        })
        vim.cmd('colorscheme rose-pine')
    end
}
