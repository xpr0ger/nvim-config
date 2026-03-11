return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			globalstatus = true,
			icons_enabled = true,
			theme = "catppuccin-frappe",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },

			ignore_focus = {
				"neo-tree",
				"dapui_watches",
				"dapui_stacks",
				"dapui_breakpoints",
				"dapui_scopes",
				"dapui_console",
				"dap-repl",
				"neotest-output-panel",
				"neotest-summary",
				"TelescopePrompt",
			},
		},
		sections = {
			lualine_c = { { "filename", path = 1 } },
		},
	},
}
