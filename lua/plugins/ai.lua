local opts = {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("minuet").setup({
        virtualtext = {
          auto_trigger_ft = { "python", "lua", "golang" },
          keymap = {
            accept = "<A-a>",
            prev = "<A-[>",
            next = "<A-]>",
            dismiss = "<A-e>",
          },
        },
        provider = "openai_fim_compatible",
        n_completions = 1,
        context_window = 512,
        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM",
            name = "Ollama",
            end_point = "http://localhost:11434/v1/completions",
            model = "qwen2.5-coder:7b",
            optional = {
              max_tokens = 56,
              top_p = 0.9,
            },
          },
        },
      })
    end,
  },
  {
    "David-Kunz/gen.nvim",
    keys = {
      { "<leader>op", "<CMD>Gen<CR>", "Open AI panel" },
    },
    opts = {
      model = "qwen2.5-coder:7b",
      display_mode = "vertical-split",
    },
  },
}

return opts
