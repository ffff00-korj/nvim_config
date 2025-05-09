local opts = {
  "leoluz/nvim-dap-go",
  config = function()
    require("dap-go").setup()
  end,
}

return opts
