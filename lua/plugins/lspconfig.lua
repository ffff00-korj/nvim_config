local opts = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "ckipp01/stylua-nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua", -- file type
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            disable = { "missing-fields" },
          },
        },
      },
    })
    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.ruff.setup({ capabilities = capabilities })

    vim.keymap.set("n", "<F3>", function()
      if vim.bo.filetype == "lua" then
        require("stylua-nvim").format_file()
        return
      end
      vim.lsp.buf.format()
    end, { desc = "Format current buffer" })
  end,
}

return opts
