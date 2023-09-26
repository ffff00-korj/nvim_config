local options = {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
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
