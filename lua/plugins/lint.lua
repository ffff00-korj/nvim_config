local opts = {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      python = (function(linters)
        local available = {}
        for _, linter in ipairs(linters) do
          local cmd = require("lint").linters[linter] and require("lint").linters[linter].cmd or linter
          local is_available = false
          if type(cmd) == "function" then
            is_available = vim.fn.executable(cmd()) == 1
          elseif type(cmd) == "string" then
            is_available = vim.fn.executable(cmd) == 1
          elseif type(cmd) == "table" then
            is_available = vim.fn.executable(cmd[1]) == 1
          end
          if is_available then
            table.insert(available, linter)
          end
        end
        return available
      end)({ "mypy", "ruff", "flake8", "isort" }),
    }
    vim.api.nvim_create_autocmd({ "LspAttach", "TextChanged" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}

return opts
