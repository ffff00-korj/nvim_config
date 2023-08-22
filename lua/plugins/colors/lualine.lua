local options = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup(require("plugins.colors.lualine_config"))
    end
}

return options
