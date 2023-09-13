local options = {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    config = function()
        -- dark | light
        vim.o.background = "dark"
        require("vscode").setup({
            -- style = 'light'
            transparent = true,
            italic_comments = true,
            disable_nvimtree_bg = true,
        })
        require("vscode").load()
    end
}

return options

