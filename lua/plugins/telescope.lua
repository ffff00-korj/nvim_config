local opts = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-dap.nvim",
    "mfussenegger/nvim-dap",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup({
      opts = opts,
      defaults = vim.tbl_extend("force", require("telescope.themes").get_ivy(), {
        file_ignore_patterns = {
          ".git",
          ".venv",
          "venv",
          ".mypy_cache",
          "node_modules",
          ".trash",
        },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
        extensions = {
          fzf = {},
        },
      }),
    })
    telescope.load_extension("fzf")

    vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "Current opened buffers" })
    vim.keymap.set("n", "<leader>pb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {
      desc = "[p]rovide search in current [b]uffer",
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", function()
      builtin.find_files({ no_ignore = true })
    end, { desc = "[p]rocess [f]iles" })
    vim.keymap.set("n", "<leader>pg", function()
      builtin.git_files({ no_ignore = true })
    end, { desc = "[p]rocess [g]it files" })
    vim.keymap.set("n", "<leader>pr", function()
      builtin.lsp_references()
    end, { desc = "[p]rocess lsp_[r]eferences" })
    vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "[p]rocess grep [s]tring" })
    vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "[p]rocess [h]elp" })

    telescope.load_extension("dap")
    vim.keymap.set("n", "<leader>pdc", "<cmd>Telescope dap commands<cr>", { desc = "[p]rocess [d]ebug [c]ommands" })
    vim.keymap.set(
      "n",
      "<leader>pdb",
      "<cmd>Telescope dap list_breakpoints<cr>",
      { desc = "[p]rocess [d]ebug [b]reakpoints" }
    )
    vim.keymap.set("n", "<leader>pdv", "<cmd>Telescope dap variables<cr>", { desc = "[p]rocess [d]ebug [v]ariables" })
    vim.keymap.set("n", "<leader>pds", "<cmd>Telescope dap frames<cr>", { desc = "[p]rocess [d]ebug [s]tack" })
  end,
}

return opts
