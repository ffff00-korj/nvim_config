local options = {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local python_env = function()
            local venv_path = os.getenv("VIRTUAL_ENV")
            if venv_path then
                return venv_path .. "/bin"
            end
        end
        if pythonenv then
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            
            null_ls.setup({
                sources = {
                    formatting.isort.with({ prefer_local = python_env }),
                    formatting.black.with({ prefer_local = python_env }),
                    diagnostics.flake8.with({ prefer_local = python_env }),
                    diagnostics.mypy.with({ prefer_local = python_env }),
                },
            })
        end
    end,
}

return options
