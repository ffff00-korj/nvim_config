return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'mfussenegger/nvim-dap-python',
    },
    keys = {
        { '<F1>',       ':DapToggleBreakpoint<CR>' },
        { '<F2>',       ':DapStepOver<CR>' },
        { '<F3>',       ':DapStepInto<CR>' },
        { '<F4>',       ':DapStepOut<CR>' },
        { '<F5>',       ':DapContinue<CR>' },
        { '<F10>',      ':lua require("dapui").toggle()<CR>' },
        -- only for python
        { '<leader>dn', ':lua require("dap-python").test_method()<CR>' },
        { '<leader>df', ':lua require("dap-python").test_class()<CR>' },
    },
    config = function()
        require('dap-python').setup()
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

        table.insert(dap.configurations.python, {
            name = 'Django',
            type = 'python',
            request = 'launch',
            stopOnEntry = false,
            program = function()
                return vim.fn.getcwd() .. '/' .. vim.fn.input('Django project name: ') .. '/manage.py'
            end,
            cwd = '${workspaceFolder}',
            args = {
                'runserver',
                '--no-color',
                '--noreload',
            },
            debugOptions = {
                'RedirectOutput',
                'DjangoDebugging'
            }
        })
    end
}
