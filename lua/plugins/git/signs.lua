local options = {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end
                map('n', '<leader>hp', gs.preview_hunk_inline)
            end
        }
    end
}

return options
