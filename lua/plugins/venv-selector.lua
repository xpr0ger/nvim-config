return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"nvim-telescope/telescope.nvim",
	},
	opts = {},
	keys = {
		{ "<leader>lpv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
	},
}
