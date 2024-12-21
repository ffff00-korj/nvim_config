local opts = {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
}

return opts
