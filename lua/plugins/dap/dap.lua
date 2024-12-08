local opts =
{
    "mfussenegger/nvim-dap",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
    },
    lazy = true,
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        vim.keymap.set("n", "<F5>", function()
            require("dap.ext.vscode").load_launchjs()
            dap.continue()
        end, { desc = "Continue debugging" })

        vim.keymap.set("n", "<F6>", function()
            dap.repl.open()
        end, { desc = "Open REPL" })

        vim.keymap.set("n", "<F7>", function()
            dap.run_to_cursor()
        end, { desc = "Run debugging to cursor" })

        vim.keymap.set("n", "<F10>", function()
            dap.step_over()
        end, { desc = "Step over" })

        vim.keymap.set("n", "<F11>", function()
            dap.step_into()
        end, { desc = "Step into" })

        vim.keymap.set("n", "<F12>", function()
            dap.step_out()
        end, { desc = "Step out" })

        vim.keymap.set("n", "<leader>Db", function()
            dap.toggle_breakpoint()
        end, {
            desc = "Toggle [D]ebug [b]reakpoint",
        })

        vim.keymap.set("n", "<leader>DB", function()
            local condition = vim.fn.input "Breakpoint condition: "
            dap.set_breakpoint(condition)
        end, {
            desc = "Toggle [D]ebug conditional [B]reakpoint",
        })
    end,
}

return opts
