local opts = {
    "nomnivore/ollama.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
    keys = {
        {
            "<leader>oo",
            ":<c-u>lua require('ollama').prompt()<cr>",
            desc = "ollama prompt",
            mode = { "n", "v" },
        },
        {
            "<leader>oG",
            ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
            desc = "ollama Generate Code",
            mode = { "n", "v" },
        },
    },
    ---@type Ollama.Config
    opts = {
        model = "qwen2.5-coder:3b",
        prompts = {
            Sample_Promt = false,
        },
    },
}

return opts
