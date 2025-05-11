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
    "mfussenegger/nvim-lint",
  },
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "Keymaps for Lsp",
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("ca", vim.lsp.buf.code_action, "Show [c]ode [a]ctions")
        map("<F2>", vim.lsp.buf.rename, "[R]e[n]ame")
        map(
          "<leader>ht",
          (function(config)
            local default, active = vim.diagnostic.config(), false
            return function()
              vim.diagnostic.config(active and default or config)
              active = not active
            end
          end)({ virtual_text = false, virtual_lines = { current_line = true } }),
          "[H]int [T]oggle"
        )
      end,
    })
  end,
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
      on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      capabilities = capabilities,
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
            diagnosticMode = "off",
            linting = false,
          },
        },
      },
    })
    lspconfig.gopls.setup({ capabilities = capabilities })
    lspconfig.ruff.setup({
      capabilities = capabilities,
      init_options = {
        settings = {
          lint = { enable = false },
        },
      },
    })
    lspconfig.bashls.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })

    vim.keymap.set("n", "<F3>", function()
      if vim.bo.filetype == "lua" then
        require("stylua-nvim").format_file()
      elseif vim.bo.filetype == "python" then
        vim.lsp.buf.code_action({
          context = { only = { "source.fixAll" } },
          apply = true,
        })
        vim.defer_fn(function()
          vim.lsp.buf.format()
        end, 100)
        require("lint").try_lint()
      else
        vim.lsp.buf.format()
      end
    end, { desc = "Format current buffer" })
  end,
}

return opts
