local icons = require("plugins.icons.sign-icons")

return {
    'diagnostics',
    sections = { 'error', 'warn', 'info', 'hint', 'other', },
    sources = { "nvim_diagnostic" },
    diagnostics_color = {
        -- rewrite hint separator color
        hint = 'DiagnosticHint',
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
