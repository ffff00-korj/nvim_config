local colors = require("plugins.colors.lualine")
local conditions = require("plugins.utils.conditions")

return {
    'o:encoding',
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
}
