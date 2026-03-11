return {
	"nvim-neotest/neotest",
	lazy = false,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
	},
	init = function()
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
	end,
	keys = function()
		return require("config.keys.neotest").get_global_bindings()
	end,
	opts = function()
		return {
			adapters = {
				require("neotest-go")({
					experimental = {
						test_table = true,
					},
					args = {
						require("config.golang").build_tags,
						"-coverprofile=" .. vim.fn.getcwd() .. "/build/cover.out",
					},
				}),
			},
			discovery = {
				enabled = true,
			},
			running = {
				concurrent = false,
			},
		}
	end,
}
