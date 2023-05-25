return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'mfussenegger/nvim-dap-python',
        'rcarriga/nvim-dap-ui',
        'stevearc/dressing.nvim',
    },
    keys = {
        { 'dc',         ':DapStepOver<CR>' },
        { 'di',         ':DapStepInto<CR>' },
        { 'do',         ':DapStepOut<CR>' },
        { '<leader>dt', ':DapToggleBreakpoint<CR>' },
        { '<leader>dc', ':DapContinue<CR>' },
    },
    config = function()
        local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
        pcall(function()
            require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
        end)
        require('dap.ext.vscode').load_launchjs()
    end
}
