local options = {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
        vim.opt.listchars:append "space:⋅"

        require("indent_blankline").setup({
            space_char_blankline = " ",
        })
    end
}

return options
