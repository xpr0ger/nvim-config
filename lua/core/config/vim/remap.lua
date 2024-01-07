vim.g.mapleader = " "
vim.keymap.set("n", "<leader>c", vim.cmd.bd, { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Write buffer content" })
vim.keymap.set("n", "<F7>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

vim.keymap.set({ "n" }, "]b", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set({ "n" }, "[b", "<cmd>bp<cr>", { desc = "Prev buffer" })
