return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = { "lua_ls", "vimls" },
	},
	config = function(LazyPlugin, opts)
		mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup(opts)

		local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = cmp_caps,
				})
			end,
		})
	end,
	priority = 41,
}
