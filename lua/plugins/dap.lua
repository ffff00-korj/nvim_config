return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'mfussenegger/nvim-dap-python',
        'nvim-neotest/neotest',
        'nvim-neotest/neotest-python',
        'AckslD/swenv.nvim',
        'stevearc/dressing.nvim',
    },
    keys = {
        { 'dc',          ':DapStepOver<CR>' },
        { 'di',          ':DapStepInto<CR>' },
        { 'do',          ':DapStepOut<CR>' },
        { '<leader>dt',  ':DapToggleBreakpoint<CR>' },
        { '<leader>dc',  ':DapContinue<CR>' },
        { '<leader>dui', ':lua require("dapui").toggle()<CR>' },
        { '<leader>dm',  '<cmd>lua require("neotest").run.run()<cr>' },
        { '<leader>dM',  "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>" },
        { '<leader>df',  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>" },
        { '<leader>dF',  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>" },
        { '<leader>dS',  "<cmd>lua require('neotest').summary.toggle()<cr>" },
        { '<leader>dC',  "<cmd>lua require('swenv.api').pick_venv()<cr>" },
    },
    config = function()
        local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
        pcall(function()
            require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
        end)
        require('swenv').setup({
            venvs_path = vim.fn.expand('~/.pyenv/versions/*/envs/')
        })
        require('dapui').setup()
        local dap, dapui = require('dap'), require('dapui')

        dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
        end
        require('dap.ext.vscode').load_launchjs()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = {
                        justMyCode = false,
                        console = "integratedTerminal",
                    },
                    args = { "--log-level", "DEBUG", "--quiet" },
                    runner = "pytest",
                })
            }
        })
    end
}
