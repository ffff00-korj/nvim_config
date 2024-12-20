local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- need to set up this before lazy load plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

return require("lazy").setup({
  spec = "plugins",
  change_detection = { notify = false },
})
