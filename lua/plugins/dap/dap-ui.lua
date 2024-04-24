local options = {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        { "mfussenegger/nvim-dap" },
        { "nvim-neotest/nvim-nio" },
    },
    keys = {
        "<leader>Du",
        "<leader>DU",
    },
    config = function()
        print "dap"
        local dapui = require "dapui"

        dapui.setup()

        vim.keymap.set("n", "<leader>Du", function()
            dapui.toggle { layout = 2 }
        end, {
            desc = "Toggle [D]ebug [u]I (only debug console and terminal)",
        })

        vim.keymap.set("n", "<leader>DU", function()
            dapui.toggle()
        end, {
            desc = "Toggle [D]ebug [U]I (full standart UI)",
        })
    end,
}

return options
