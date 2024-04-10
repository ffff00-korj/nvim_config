local options = {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        require "lsp_signature".setup({
            bind = false,          -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "single", -- single|rounded|none
            },
            hint_enable = false,
            -- hint_prefix = "Hint-> ",
            hi_parameter = "Visual",
        })
    end
}

return options
