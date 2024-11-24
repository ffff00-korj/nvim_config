vim.api.nvim_create_autocmd({ "BufEnter", }, {
    desc = "Auto select virtualenv Nvim open",
    callback = function()
        local venv = vim.fn.findfile(".python-version", vim.fn.getcwd() .. ";")
        if venv ~= "" then
            require("venv-selector").retrieve_from_cache()
        end
    end,
    once = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
