return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = function(_, keys)
		local builtin = require("telescope.builtin")
		return require("config.keys.telescope").get_global_bindings(builtin)
	end,
	opts = {},
}
