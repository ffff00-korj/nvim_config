local options = {
    "doums/dark.nvim",
    lazy = false,
    config = function()
        -- setup colorscheme
        vim.cmd('colorscheme dark')
        -- transparent background
        vim.cmd("hi Normal ctermbg=none guibg=none")
        -- vim cmd bakground fix
        vim.cmd("hi Pmenu guibg=none guifg=none")       -- menu
        vim.cmd("hi FloatBorder guibg=none guifg=none") -- signature
        -- custom git signs
        vim.cmd("hi clear SignColumn")
        vim.cmd("hi DiffAdd guibg=none guifg=#26A269")
        vim.cmd("hi DiffChange guibg=none guifg=#61AFEF")
        vim.cmd("hi DiffDelete guibg=none guifg=#E06C75")
        vim.cmd("hi DiffText guibg=none guifg=gray")
        -- change line number font folor
        vim.cmd("hi LineNr guifg=#797979")
    end
}

return options
