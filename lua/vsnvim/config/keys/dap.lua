local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>d", group = "Debug" },
		{ "<F5>", action("workbench.action.debug.start"), desc = "Debug: Start/Continue" },
		{ "<F6>", action("workbench.action.debug.stop"), desc = "Debug: Stop" },
		{ "<F7>", action("workbench.action.debug.stepInto"), desc = "Debug: Step Into" },
		{ "<F8>", action("workbench.action.debug.stepOver"), desc = "Debug: Step Over" },
		{ "<F9>", action("workbench.action.debug.stepBack"), desc = "Debug: Step Back" },
		{ "<F10>", action("workbench.action.debug.stepOut"), desc = "Debug: Step Out" },

		{ "<leader>db", group = "Breakpoint" },
		{ "<leader>dbt", action("editor.debug.action.toggleBreakpoint"), desc = "Toggle Breakpoint" },

		{ "<leader>du", action("workbench.view.debug"), desc = "Toggle Debug UI" },
	}
end

return M
