local icons = require("plugins.icons.sign-icons")
local colors = {
    blue   = '#51afef',
    yellow = "#e0af68",
    white  = "white",
    violet = '#a9a1e1',
    green  = '#98be65',
    orange = '#FF8800',
    red    = '#ec5f67',
}
local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
}
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
        -- these are to remove the defaults
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

ins_left {
    function()
        return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 0, right = 1 },
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.white },
}

ins_left { 'location' }

ins_left {
    'diagnostics',
    sections = { 'error', 'warn', 'info', 'hint', 'other', },
    sources = { "nvim_diagnostic" },
    diagnostics_color = {
        error = 'DiagnosticError',
        warn  = 'DiagnosticWarn',
        info  = 'DiagnosticInfo',
        hint  = 'DiagnosticHint',
        other = 'DiagnosticOther',
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

ins_left {
    function()
        return '%='
    end,
}

ins_left {
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = '#ffffff', gui = 'bold' },
}


ins_right {
    'o:encoding',
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false,
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
    'diff',
    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

ins_right {
    function()
        return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 0, right = 1 },
}

return config
