local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
    settings = {
        pyright = {
            autoImportCompletion = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis
                ignore = { "*" },
            },
        }
    },
})

local ruff_on_attach = function(client, bufnr)
    if client.name == 'ruff' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
    end
end

require('lspconfig').ruff.setup {
    on_attach = ruff_on_attach,
    filetypes = { "python" },
    init_options = {
        settings = {
            args = {},
            lineLenght = 79,
        }
    }
}

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                    "on_attach",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

local util = require("lspconfig.util")
lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = false,
            analyses = {
                unusedparams = true,
            },
        },
    },
}

lspconfig.html.setup {
    capabilities = capabilities,
}

lspconfig.clangd.setup {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "hpp" },
}
