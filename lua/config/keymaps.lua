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

vim.keymap.set("i", "<C-y>", "<C-^>", { desc = "Toggle ru/en insert language" })
