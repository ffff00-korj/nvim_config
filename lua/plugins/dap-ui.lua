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
    end
}
