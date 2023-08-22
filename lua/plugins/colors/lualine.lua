local options = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local icons = require("plugins.icons.sign-icons")
        local config = {
            sections = {
                lualine_b = {
                    {
                        'diagnostics',
                        sections = { 'error', 'warn', 'info', 'hint' },

                        sources = { "nvim_diagnostic" },
                        diagnostics_color = {
                            error = 'DiagnosticError', -- Changes diagnostics' error color.
                            warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                            info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                            hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                        },
                        symbols = {
                            error = icons.error .. " ",
                            warn = icons.warn .. " ",
                            info = icons.info .. " ",
                            hint = icons.hint .. " ",
                            other = icons.other .. " "
                        },
                        colored = true,
                        update_in_insert = false,
                        always_visible = false,
                    }
                },
            },
            extentions = {},
        }
        require("lualine").setup(config)
    end
}

return options
