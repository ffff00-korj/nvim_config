local opts = {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
        require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
    end
}

return opts
