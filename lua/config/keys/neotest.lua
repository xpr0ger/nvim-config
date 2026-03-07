local M = {}

local first_usage = true
local open_panels = function(callback)
	return function()
		local neotest = require("neotest")
		if first_usage then
			vim.fn.timer_start(1000, callback)
			first_usage = false
		else
			callback()
		end
		neotest.summary.open()
		neotest.output_panel.open()
	end
end

M.get_global_bindings = function()
	return {
		{ "<leader>t", group = "Tests" },
		{
			"<leader>tc",
			open_panels(function()
				require("neotest").run.run()
			end),
			desc = "Run current test",
			noremap = false,
		},
		{
			"<leader>td",
			open_panels(function()
				require("neotest").run.run(vim.fn.expand("%"))
			end),
			desc = "Run tests in current file",
			noremap = false,
		},
		{
			"<leader>tp",
			open_panels(function()
				require("neotest").run.run(vim.fn.getcwd())
			end),
			desc = "Run tests in project",
			noremap = false,
		},
		{
			"<leader>tx",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop tests",
			noremap = false,
		},
		{ "<leader>ti", group = "Panels" },
		{
			"<leader>tio",
			function()
				local neotest = require("neotest")
				neotest.summary.open()
				neotest.output_panel.open()
			end,
			desc = "Open",
			noremap = false,
		},
		{
			"<leader>tic",
			function()
				local neotest = require("neotest")
				neotest.summary.close()
				neotest.output_panel.close()
			end,
			desc = "Close",
			noremap = false,
		},
		{
			"<leader>tis",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle summary",
			noremap = false,
		},
		{
			"<leader>tiO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Toggle output",
			noremap = false,
		},
	}
end

return M
