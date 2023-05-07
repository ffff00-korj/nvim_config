return {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    name = 'gruvbox',
    config = function()
        vim.cmd.colorscheme('gruvbox')
        require('gruvbox').setup({
            palette_overrides = {
                -- background
                dark0 = '#1d1f21',
                -- colomn
                dark1 = '#1d1f21',
            },
        })
        vim.cmd.colorscheme('gruvbox')
    end
}
