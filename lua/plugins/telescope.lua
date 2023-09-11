local options = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "mfussenegger/nvim-dap" },
        { "nvim-treesitter/nvim-treesitter" },
        { "rcarriga/nvim-dap-ui" },
    },
    keys = {
        { "<leader><leader>", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
        { "<leader>sb",       "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    },
    opts = function()
        return {
            defaults = {
                mappings = {
                    n = { ["q"] = require("telescope.actions").close },
                },
            },
        }
    end,
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("dap")


        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", function() builtin.find_files() end, {})
        vim.keymap.set("n", "<leader>pg", function() builtin.git_files() end, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({
                search = vim.fn.input("Grep > ")
            });
        end)
    end,
}

return options
