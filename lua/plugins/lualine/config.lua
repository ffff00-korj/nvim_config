local config = {
    options = {
        component_separators = '',
        section_separators = '',
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left(require("plugins.lualine.components.separator"))
ins_left(require("plugins.lualine.components.filename"))
ins_left('location')
ins_left(require("plugins.lualine.components.branch"))
ins_left(require("plugins.lualine.components.diagnostics"))

-- middle separator
ins_left(
    function()
        return '%='
    end
)
ins_left(require("plugins.lualine.components.lsp"))

ins_right(require("plugins.lualine.components.encoding"))
ins_right(require("plugins.lualine.components.diff"))
ins_right(require("plugins.lualine.components.separator"))

return config
