local options = {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        { "mfussenegger/nvim-dap" },
        { "nvim-neotest/nvim-nio" },
        { "folke/neodev.nvim" },
    },
    keys = {
        "<leader>Du",
        "<leader>Dk",
    },
    config = function()
        local dapui = require("dapui")
        dapui.setup {
            layouts = {
                {
                    elements = {
                        "watches",
                        "scopes",
                    },
                    size = 0.25,
                    position = "right",
                },
                {
                    elements = {
                        "repl",
                    },
                    size = 0.25,
                    position = "bottom",
                },
            },
        }

        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })

        vim.keymap.set("n", "<leader>Du", function()
            dapui.toggle()
        end, {
            desc = "Toggle [D]ebug [u]I",
        })
        vim.keymap.set({ "n", "v" }, "<leader>Dk", function()
            dapui.eval()
        end, {
            desc = "Evaluate debug expression",
        })
        vim.keymap.set("n", "<leader>Dts", function()
            dapui.float_element("stacks", { enter = true })
        end, {
            desc = "[D]ebug [t]oggle [s]tacks",
        })
        vim.keymap.set("n", "<leader>Dtb", function()
            dapui.float_element("breakpoints", { enter = true })
        end, {
            desc = "[D]ebug [t]oggle [b]reakpoints",
        })
        vim.keymap.set("n", "<leader>Dtw", function()
            dapui.float_element("watches", { enter = true })
        end, {
            desc = "[D]ebug [t]oggle [w]atches",
        })
        vim.keymap.set("n", "<leader>Dtl", function()
            dapui.float_element(nil, { enter = true })
        end, {
            desc = "[D]ebug [t]oggle [l]ist",
        })
    end,
}

return options
