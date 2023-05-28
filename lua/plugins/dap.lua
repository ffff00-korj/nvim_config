return {
    'mfussenegger/nvim-dap',
    lazy = true,
    dependencies = {
        'mfussenegger/nvim-dap-python',
        'theHamsta/nvim-dap-virtual-text',
        'rcarriga/nvim-dap-ui',
        'stevearc/dressing.nvim',
    },
    keys = {
        { '<leader>b',  ':DapToggleBreakpoint<CR>' },
        { '<leader>B',  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition > '))<CR>" },
        { '<leader>lp', ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Breakpoint condition > '))<CR>" },
        { '<F5>',       ':DapContinue<CR>' },
        { '<F10>',      ':DapStepOver<CR>' },
        { '<F11>',      ':DapStepInto<CR>' },
        { '<F12>',      ':DapStepOut<CR>' },
    },
    config = function()
        local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
        pcall(function()
            require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
        end)
        local dap = require('dap')
        dap.configurations.python = require('plugins.dap.python')

        require('dap.ext.vscode').load_launchjs()
        require("nvim-dap-virtual-text").setup()
    end
}
