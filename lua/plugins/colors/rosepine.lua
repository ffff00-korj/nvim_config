local options = {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            -- @usage 'auto'|'main'|'moon'|'dawn'
            variant = "auto",
            --- @usage 'main'|'moon'|'dawn'
            dark_variant = 'main',
            disable_background = true,
        })
        vim.cmd("colorscheme rose-pine")
    end
}

return options
