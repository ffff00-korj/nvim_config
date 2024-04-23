local options = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
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
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension('dap')

        vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", {})
        vim.keymap.set("n", "<leader>pb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {})

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", function() builtin.find_files() end, {})
        vim.keymap.set("n", "<leader>pg", function() builtin.git_files() end, {})
        vim.keymap.set("n", "<leader>pr", function() builtin.lsp_references() end, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({
                search = vim.fn.input("grep < ")
            });
        end)
        vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>pdc", "<cmd>Telescope dap commands<cr>", {})
        vim.keymap.set("n", "<leader>pdb", "<cmd>Telescope dap list_breakpoints<cr>", {})
        vim.keymap.set("n", "<leader>pdv", "<cmd>Telescope dap variables<cr>", {})
        vim.keymap.set("n", "<leader>pds", "<cmd>Telescope dap frames<cr>", {})
    end,
}

return options
