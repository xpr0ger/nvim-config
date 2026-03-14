return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	keys = require("config.keys.nvim-lint"),
	opts = {
		linters_by_ft = {
			go = { "golangcilint" },
			sh = { "shellcheck" },
			bash = { "shellcheck" },
			zsh = { "shellcheck" },
			ansible = { "ansible_lint" },
			yaml = { "ansible_lint" },
			json = { "jsonlint" },
			markdown = { "markdownlint" },
			python = { "ruff" },
		},
	},
	config = function(_, opts)
		require("lint").linters_by_ft = opts.linters_by_ft
	end,
	init = function()
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
