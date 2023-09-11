local options = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
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
