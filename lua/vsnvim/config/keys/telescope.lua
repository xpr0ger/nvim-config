local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>f", group = "Find" },
		{ "<leader>fc", action("workbench.action.showCommands"), desc = "Command palette", noremap = false },
		{ "<leader>ff", action("workbench.action.quickOpen"), desc = "Files", noremap = false },
		{ "<leader>fw", action("workbench.action.findInFiles"), desc = "Live search", noremap = false },
		{ "<leader>fb", action("workbench.action.showAllEditors"), desc = "Buffers", noremap = false },
		{ "<leader>fs", action("workbench.action.showAllSymbols"), desc = "Symbols across project", noremap = false },
	}
end

return M
