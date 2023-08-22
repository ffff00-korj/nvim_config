local options = {
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

        require("plugins.colors.dap")
        local icons = require("plugins.icons.debug-icons")
        vim.fn.sign_define('DapBreakpoint',
            { text = icons.breakpoint, texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointCondition',
            { text = icons.condution, texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointRejected',
            { text = icons.rejected, texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint', {
            text = icons.logpoint,
            texthl = 'DapLogPoint',
            linehl = 'DapLogPoint',
            numhl = 'DapLogPoint'
        })
        vim.fn.sign_define('DapStopped', {
            text = icons.stopped,
            texthl = 'DapStopped',
            linehl = 'DapStopped',
            numhl = 'DapStopped'
        })
    end
}

return options
