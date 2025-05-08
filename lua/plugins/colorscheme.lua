local opts = {
  "wnkz/monoglow.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme monoglow-void")
  end,
}

return opts
