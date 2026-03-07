return {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	event = "VeryLazy",
	keys = function()
		return require("config.keys.dropbar").get_bindings()
	end,
	opts = {
		bar = {
			hover = true,
		},
	},
	init = function()
		vim.opt.mousemoveevent = true
	end,
}
