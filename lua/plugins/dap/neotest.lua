local options = {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-python",
    },
    keys = {
        { "<leader>dm",
            "<cmd>lua require('                                                               neotest ').run.run()<cr>" },
        { "<leader>dM", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>" },
        { "<leader>df", "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>" },
        { "<leader>dF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>" },
        { "<leader>dS", "<cmd>lua require('neotest').summary.toggle()<cr>" },
    },
    config = function()
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

return options
