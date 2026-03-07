return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
	},
	keys = function()
		return require("config.keys.dap").get_global_bindings()
	end,
	init = function()
		local wk = require("which-key")
		local dap_keys = require("config.keys.dap")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserDapConfig", { clear = true }),
			callback = function(_)
				wk.add(dap_keys.get_buffer_bindings())
			end,
		})
	end,
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FF0000" })
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#00AA00" })

		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapBreakpoint" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint" })

		dap.listeners.before.event_terminated["close_ui"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["close_ui"] = function()
			dapui.close()
		end
		dap.listeners.after.event_initialized["open_ui"] = function()
			dapui.open()
		end
	end,
}
