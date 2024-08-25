local options = {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    enabled = true,
    lazy = false,
    init = function()
        vim.opt.wrap = false
        vim.opt.sidescrolloff = 36

        vim.g.neominimap = {
            auto_enable = true,
        }
    end,
}

return options
