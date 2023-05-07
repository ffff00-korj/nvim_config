return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        lazy = true
    },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'gruvbox-baby',
            }
        }
    end
}
