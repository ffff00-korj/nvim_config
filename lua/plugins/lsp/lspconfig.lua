local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local util = require("lspconfig.util")

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
    capabilities = capabilities,
}

lspconfig.pyright.setup({
    on_attach = on_attach,
    settings = {
        pyright = {
            autoImportCompletion = true,
        },
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "off",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
                reportUnusedVariable = "off",
            },
        }
    },
})

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

lspconfig.clangd.setup {
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "hpp" },
}
