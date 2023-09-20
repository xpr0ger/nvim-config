return {
	"jay-babu/mason-null-ls.nvim",
	version = "^2.0.0",
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"cspell",
			},
			handlers = {},
		})
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {},
		})
	end,
}
