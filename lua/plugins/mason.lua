local opts = {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    cmd = "Mason",
    config = function()
        require("mason").setup()
        require("mason-tool-installer").setup {
            ensure_installed = {
                "lua-language-server",
                "pyright",
                "ruff",
            },
        }
    end
}

return opts
