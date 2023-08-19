return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
    },
    keys = {
        { '<leader>dui', ':lua require("dapui").toggle()<CR>' },
    },
    config = function()
        require('dapui').setup {
            layouts = {
                {
                    elements = {
                        "scopes",
                        "watches",
                    },
                    size = 0.3,
                    position = "left",
                },
                {
                    elements = {
                        "repl",
                    },
                    size = 0.3,
                    position = "bottom",
                },
            },
        }

        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

        vim.fn.sign_define('DapBreakpoint',
            { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointCondition',
            { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointRejected',
            { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint', {
            text = '',
            texthl = 'DapLogPoint',
            linehl = 'DapLogPoint',
            numhl = 'DapLogPoint'
        })
        vim.fn.sign_define('DapStopped', {
            text = '',
            texthl = 'DapStopped',
            linehl = 'DapStopped',
            numhl = 'DapStopped'
        })
    end
}
