local opts = {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  cmd = "Mason",
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "ruff",
        "debugpy",
        "html-lsp",
        "lua-language-server",
        "pyright",
        "stylua",
        "typescript-language-server",
        "css-lsp",
      },
    })
  end,
}

return opts
