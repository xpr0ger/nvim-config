return {
	"rcarriga/nvim-notify",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	init = function(_)
		local notify = require("notify")
		vim.notify = notify

		local ok, telescope = pcall(require, "telescope")
		if ok then
			telescope.load_extension("notify")
		end
	end,
	opts = {},
}
