local function format()
  if vim.bo.filetype == "lua" then
    require("stylua-nvim").format_file()
  elseif vim.bo.filetype == "python" then
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
    vim.lsp.buf.format()
  else
    vim.lsp.buf.format()
  end
end

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
    lspconfig.pyright.setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            diagnosticMode = "openFileOnly",
            typeCheckingMode = "standart",
          },
        },
      },
    })
    lspconfig.ruff.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })

    vim.keymap.set("n", "<F3>", format, { desc = "Format current buffer" })
  end,
}

return opts
