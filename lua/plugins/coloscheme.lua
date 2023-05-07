return {
    'luisiacc/gruvbox-baby',
    name = 'gruvbox',
    config = function()
        vim.g.gruvbox_baby_function_style = "NONE"
        vim.g.gruvbox_baby_keyword_style = "italic"
        vim.cmd.colorscheme('gruvbox-baby')
    end
}
