return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'vscode',
                -- theme = 'gruvbox-baby',
                -- @usage 'rose-pine' | 'rose-pine-alt'
                -- theme = 'rose-pine-alt',
            },
        }
    end
}
