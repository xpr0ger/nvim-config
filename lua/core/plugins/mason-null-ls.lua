local none_ls_config = require("core.config.none-ls")
return {
	"jay-babu/mason-null-ls.nvim",
	version = "^2.0.0",
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	opts = {
		ensure_installed = {
			"stylua",
			"cspell",
			"golangci_lint",
			"json",
			"yaml",
			"sonarlint_language_server",
			"bash",
			"go",
			"goimports-reviser",
			"golangci_lint",
			"staticcheck",
			"revive",
			"shellharden",
			"markuplint",
			"prettier",
			"stylelint",
			"jsonlint",
		},

		handlers = {
			goimports_reviser = function(_, _)
				none_ls_config.goimports_reviser()
			end,
			cspell = function(_, _)
				none_ls_config.cspell()
			end,
		},
	},
	priority = 41,
}
