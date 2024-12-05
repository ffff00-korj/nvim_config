local options = {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "LiadOz/nvim-dap-repl-highlights" },
    build = ":TSUpdate",
    config = function()
        require("nvim-dap-repl-highlights").setup()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "python",
                "javascript",
                "typescript",
                "c",
                "lua",
                "vim",
                "query",
                "http",
                "json",
                "dap_repl",
                "markdown",
                "markdown_inline",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}

return options
