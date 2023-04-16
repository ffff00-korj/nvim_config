function SetColor(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
end

require("gruvbox").setup({
    palette_overrides = {
        -- background
        dark0 = "#1d1f21",
        -- colomn
        dark1 = "#1d1f21",
    },
})
SetColor()
