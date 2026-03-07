return {
	"lewis6991/hover.nvim",
	keys = function()
		return require("config.keys.hover").get_global_bindings()
	end,

	---@module 'hover.config'
	---@type Hover.Config
	opts = {
		init = function()
			-- Require providers
			require("hover.providers.lsp")
			require("hover.providers.gh")
			require("hover.providers.gh_user")
			-- require('hover.providers.jira')
			-- require('hover.providers.dap')
			-- require('hover.providers.fold_preview')
			-- require('hover.providers.man')
			-- require('hover.providers.dictionary')
		end,
		preview_opts = {
			border = "rounded",
		},
		-- Whether the hover window will take focus
		preview_extract_button = "focus",
		title = true,
	},
}
