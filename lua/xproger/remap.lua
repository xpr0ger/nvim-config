vim.g.mapleader = " "
vim.keymap.set("n", "<leader>c", vim.cmd.bd, { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Write buffer content" })
vim.keymap.set("n", "<F7>", "<cmd>ToggleTerm<CR>", { desc = "Write buffer content" })

vim.keymap.set({ "n", "i" }, "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set({ "n", "i" }, "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set({ "n", "i" }, "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set({ "n", "i" }, "<C-k>", "<C-w>k", { desc = "Move to top window" })

vim.keymap.set({ "n"}, "<leader>]b", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set({ "n" }, "<leader>[b", "<cmd>bp<cr>", { desc = "Prev buffer" })
