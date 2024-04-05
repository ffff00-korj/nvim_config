local options = {
    "Mofiqul/vscode.nvim",
    config = function()
        require('vscode').setup()
        require('vscode').load()
    end
}

return options
