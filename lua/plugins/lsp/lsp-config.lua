local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
    capabilities = capabilities,
}

local function get_python_path(workspace)
    local util = require('lspconfig/util')
    local path = util.path
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- Find and use virtualenv in workspace directory.
    for _, pattern in ipairs({ '*', '.*' }) do
        local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
        if match ~= '' then
            return path.join(path.dirname(match), 'bin', 'python')
        end
    end

    -- Fallback to system Python.
    return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

lspconfig.pyright.setup({
    before_init = function(_, config)
        local python_path = get_python_path(config.root_dir)
        config.settings.python.pythonPath = python_path
        vim.g.python_host_prog = python_path
        vim.g.python3_host_prog = python_path
    end,
    on_attach = on_attach,
    settings = {
        pyright = { autoImportCompletion = true, },
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
                typeCheckingMode = 'off',
            },
        }
    },
})

lspconfig.lua_ls.setup {
    on_attach = function()
        on_attach()
        vim.cmd [[autocmd BufWritePre <buffer> lua require'stylua-nvim'.format_file()]]
    end,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require',
                    'on_attach',
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
