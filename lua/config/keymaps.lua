-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>:term<CR>", { desc = "Open terminal" })
vim.keymap.set("t", "<Esc>t", "<C-\\><C-n>", { desc = "Exit terminal mode" })
--
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file tree" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go way up" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go way down" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search pattern" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search pattern" })
vim.keymap.set("n", "<A-c>", "<cmd>:bd<CR>", { desc = "Close cur buffer" })
vim.keymap.set("v", "/", "\"fy/\\V<C-R>f<CR>", { desc = "Find selected words" })
-- window moves
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
--
