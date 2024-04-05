local options = {
    "Mofiqul/vscode.nvim",
    config = function()
        require('vscode').setup({
            transparent = true,
        })
        require('vscode').load()
    end
}

return options
