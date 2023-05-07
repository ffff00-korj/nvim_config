return {
    'luisiacc/gruvbox-baby',
    name = 'gruvbox',
    config = function()
        vim.g.gruvbox_baby_function_style = 'NONE'
        vim.g.gruvbox_baby_keyword_stylew = 'italic'
        vim.g.gruvbox_baby_background_color = 'dark'

        vim.cmd.colorscheme('gruvbox-baby')
    end
}
