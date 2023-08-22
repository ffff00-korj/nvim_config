local colors = require("plugins.colors.lualine")
local conditions = require("plugins.utils.conditions")

return {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.white, gui = "bold" },
}
