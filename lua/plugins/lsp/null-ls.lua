local options = {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local python_env = function()
            local venv_path = os.getenv("VIRTUAL_ENV")
            if venv_path then
                return venv_path .. "/bin"
            end
        end
        if not python_env() then
            return nil
        end
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        null_ls.setup({
            sources = {
                formatting.isort,
                formatting.black,
                diagnostics.flake8,
                diagnostics.mypy.with({
                    extra_args = { "--ignore-missing-imports" },
                }),
            },
        })
    end,
}

return options
