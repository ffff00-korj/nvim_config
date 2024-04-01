local options = {
    "felipeagc/fleet-theme-nvim",
    config = function()
        vim.cmd("colorscheme fleet")
        vim.cmd("hi Normal ctermbg=none guibg=none")
        vim.cmd("hi clear SignColumn")
    end
}

return options
