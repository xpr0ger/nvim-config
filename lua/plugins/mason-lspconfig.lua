return {
	"mason-org/mason-lspconfig.nvim",
	layz = false,
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"lua_ls",
			"vimls",
			"gopls",
			"jsonls",
			"bashls",
			"html",
			"ts_ls",
			"vue_ls",
			"cssls",
			"templ",
			"dockerls",
			"htmx",
			"docker_compose_language_service",
			"tailwindcss",
			-- See https://github.com/sqls-server/sqls?tab=readme-ov-file#configuration-methods
			"sqls",
			"clangd",
			"ansiblels",
			"typos_lsp",
		},
	},
	-- TODO: Move to init
	config = function(_, opts)
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup(opts)

		local lsp_configs = require("config.lsp")
		for lsp_server_name, lsp_server_config_fn in pairs(lsp_configs) do
			if lsp_server_name ~= "default" then
				vim.lsp.config(lsp_server_name, lsp_server_config_fn())
			end
		end
	end,
	priority = 41,
}
