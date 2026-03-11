local M = {}

M.get_global_bindings = function()
	return {
		{ "<leader>d", group = "Debug" },
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F6>",
			function()
				require("dap").terminate()
				require("dapui").close()
			end,
			desc = "Debug: Stop",
		},
		{
			"<F7>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F8>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F9>",
			function()
				require("dap").step_back()
			end,
			desc = "Debug: Step Back",
		},
		{
			"<F10>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
	}
end

M.get_buffer_bindings = function()
	return {
		{ "<leader>db", group = "Breakpoint" },
		{
			"<leader>dbt",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>dbs",
			function()
				require("dap").set_breakpoint()
			end,
			desc = "Set Breakpoint",
		},
		{
			"<leader>dbl",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log breakpoint message: "))
			end,
			desc = "Log Breakpoint",
		},

		{
			"<leader>ds",
			function()
				require("dap").repl.open()
			end,
			desc = "REPL",
		},
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle Debug UI",
		},
		{
			"<leader>dl",
			function()
				require("dapui").open()
				require("dap").run_last()
			end,
			desc = "Run Last",
		},

		-- Go specific DAP (added when filetype is go)
		{
			"<leader>dg",
			group = "Go",
			cond = function()
				return vim.bo.filetype == "go"
			end,
		},
		{
			"<leader>dgc",
			function()
				require("dapui").open()
				require("dap-go").debug_test()
			end,
			desc = "Debug Closest Test",
			cond = function()
				return vim.bo.filetype == "go"
			end,
		},
		{
			"<leader>dgl",
			function()
				require("dapui").open()
				require("dap-go").debug_last_test()
			end,
			desc = "Debug Last Test",
			cond = function()
				return vim.bo.filetype == "go"
			end,
		},
	}
end

return M
