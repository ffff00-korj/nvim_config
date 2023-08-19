local options = {
    'AckslD/swenv.nvim',
    dependencies = {
        'stevearc/dressing.nvim',
    },
    keys = {
        { '<leader>dC', "<cmd>lua require('swenv.api').pick_venv()<cr>" },
    },
    config = function()
        require('swenv').setup({
            venvs_path = vim.fn.expand('~/.pyenv/versions/*/envs/')
        })
    end
}

return options
