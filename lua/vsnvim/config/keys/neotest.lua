local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>t", group = "Tests" },
		{ "<leader>tc", action("testing.runAtCursor"), desc = "Run current test", noremap = false },
		{ "<leader>td", action("testing.runCurrentFile"), desc = "Run tests in current file", noremap = false },
		{ "<leader>tp", action("testing.runAll"), desc = "Run tests in project", noremap = false },
		{ "<leader>tx", action("testing.cancelRun"), desc = "Stop tests", noremap = false },
		{ "<leader>ti", action("workbench.view.testing.focus"), desc = "Focus Testing Panel", noremap = false },
	}
end

return M
