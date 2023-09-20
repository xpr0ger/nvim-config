vim.g.mapleader = " "
vim.keymap.set("n", "<leader>c", vim.cmd.bd, { desc = "Close current buffer"})
vim.keymap.set("n", "<leader>w", vim.cmd.w, {desc = "Write buffer content"})
vim.keymap.set("n", "<F7>", "<cmd>ToggleTerm<CR>", {desc = "Write buffer content"})
