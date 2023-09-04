local options = {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require("lualine")
        lualine.setup(require("plugins.lualine.config"))
    end
}

return options
