local rosepine = {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            -- @usage 'auto'|'main'|'moon'|'dawn'
            variant = "auto",
            disable_background = true,
        })
        vim.cmd("colorscheme rose-pine")
    end,
}

return rosepine
