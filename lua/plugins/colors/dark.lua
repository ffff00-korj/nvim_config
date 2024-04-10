local options = {
    "doums/dark.nvim",
    lazy = false,
    config = function()
        -- setup colorscheme
        vim.cmd('colorscheme dark')
        -- transparent background
        vim.cmd("hi Normal ctermbg=none guibg=none")
        vim.cmd("hi Pmenu guibg=none guifg=none")
        -- custom git signs
        vim.cmd("hi clear SignColumn")
        vim.cmd("hi DiffAdd guibg=none guifg=#26A269")
        vim.cmd("hi DiffChange guibg=none guifg=#61AFEF")
        vim.cmd("hi DiffDelete guibg=none guifg=#E06C75")
        vim.cmd("hi DiffText guibg=none guifg=gray")
    end
}

return options
