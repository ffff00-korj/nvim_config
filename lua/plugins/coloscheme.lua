local rosepine = {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
        require('rose-pine').setup({
            -- @usage 'auto'|'main'|'moon'|'dawn'
            variant = 'auto',
        })
        vim.cmd('colorscheme rose-pine')
    end
}

local gruvbox = {
    'luisiacc/gruvbox-baby',
    name = 'gruvbox',
    config = function()
        vim.g.gruvbox_baby_function_style = 'NONE'
        vim.g.gruvbox_baby_keyword_stylew = 'italic'
        vim.g.gruvbox_baby_background_color = 'dark'

        vim.cmd.colorscheme('gruvbox-baby')
    end
}

return gruvbox
-- return rosepine
