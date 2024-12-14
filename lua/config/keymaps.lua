vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file tree" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go way up" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go way down" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search pattern" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search pattern" })
vim.keymap.set("n", "<A-c>", "<cmd>:bd<CR>", { desc = "Close cur buffer" })
vim.keymap.set("v", "/", "\"fy/\\V<C-R>f<CR>", { desc = "Find selected words" })
-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>:term<CR>", { desc = "Open terminal" })
vim.keymap.set("t", "<Esc>t", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- quick fix list
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Next from quick fix list" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Prev from quick fix list" })
-- source or launch lua
vim.keymap.set("n", "<leader>so", "<cmd>source %<CR>", { desc = "Sourse file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute cur lua line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute cur visual selection" })
