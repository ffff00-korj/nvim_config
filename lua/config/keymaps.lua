vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>t', '<cmd>:term<CR>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
-- Better split switching
vim.keymap.set('', '<C-j>', '<C-W>j')
vim.keymap.set('', '<C-k>', '<C-W>k')
vim.keymap.set('', '<C-h>', '<C-W>h')
vim.keymap.set('', '<C-l>', '<C-W>l')
-- Better split sizing
-- vim.keymap.set('', '<C-S-K>', '<C-W>+')
-- vim.keymap.set('', '<C-S-J>', '<C-W>-')
-- vim.keymap.set('', '<C-S-L>', '<C-W>>')
-- vim.keymap.set('', '<C-S-H>', '<C-W><')
-- Add split
-- <C-W>s -- horisontal
-- <C-W>v -- vertical
