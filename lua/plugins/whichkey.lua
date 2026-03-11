return {
	"folke/which-key.nvim",
	dependencies = {
		"echasnovski/mini.nvim",
		version = false,
	},
	event = "VeryLazy",
	init = function(_)
		vim.o.timeoutlen = 300
	end,
	opts = {},
}
