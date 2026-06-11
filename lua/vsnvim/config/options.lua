-- Only minimal vim options are needed as VSCode handles UI
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Requested by the user
vim.wo.number = true
vim.wo.relativenumber = true

-- VSCode specific navigation opts (optional but nice)
vim.o.scrolloff = 12
vim.o.updatetime = 250
vim.o.splitright = true
vim.o.splitbelow = true

-- Custom filetype configurations from base options
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
