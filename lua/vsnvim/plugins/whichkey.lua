return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = {
			marks = true,
			registers = true,
			spelling = { enabled = false },
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = false,
				nav = true,
				z = true,
				g = true,
			},
		},
		-- Minimal UI since it's displayed inside vscode overlay
		win = {
			border = "none",
			padding = { 1, 2 },
			title = false,
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Include VSCode Specific Key mappings registration
		local bufferline = require("vsnvim.config.keys.bufferline")
		local dap = require("vsnvim.config.keys.dap")
		local gitsigns = require("vsnvim.config.keys.gitsigns")
		local lsp = require("vsnvim.config.keys.lsp")
		local telescope = require("vsnvim.config.keys.telescope")
		local neotest = require("vsnvim.config.keys.neotest")
		local python = require("vsnvim.config.keys.python")
		local golang = require("vsnvim.config.keys.golang")
		local explorer = require("vsnvim.config.keys.explorer")
		local dropbar = require("vsnvim.config.keys.dropbar")

        wk.add(bufferline.get_bindings())
        wk.add(dap.get_bindings())
        wk.add(gitsigns.get_bindings())
        wk.add(lsp.get_bindings())
        wk.add(telescope.get_bindings())
        wk.add(neotest.get_bindings())
        wk.add(python.get_bindings())
        wk.add(golang.get_bindings())
        wk.add(explorer.get_bindings())
        wk.add(dropbar.get_bindings())
	end,
}
