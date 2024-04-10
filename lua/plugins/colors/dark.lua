local options = {
    "doums/dark.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
        vim.cmd('colorscheme dark')
        vim.cmd("hi Normal ctermbg=none guibg=none")
        vim.cmd("hi Pmenu guibg=none guifg=none")
        vim.cmd("hi clear SignColumn")
    end
}

return options
