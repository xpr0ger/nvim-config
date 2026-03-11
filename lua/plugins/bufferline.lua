return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	keys = require("config.keys.bufferline"),
	opts = {
		options = {
			mode = "buffer",
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			separator_style = "slope",
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					separator = false,
				},
			},
		},
	},
}
