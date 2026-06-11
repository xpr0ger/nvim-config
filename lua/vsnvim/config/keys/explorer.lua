local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>e", group = "Explore" },
		{ "<leader>et", action("workbench.action.toggleSidebarVisibility"), desc = "Toggle", noremap = false },
		{ "<leader>ef", action("workbench.view.explorer"), desc = "Focus", noremap = false },
		{ "<leader>eg", action("workbench.view.scm"), desc = "Git", noremap = false },
		{ "<leader>eb", action("workbench.action.showAllEditors"), desc = "Buffers", noremap = false },
		{ "<leader>es", action("workbench.action.gotoSymbol"), desc = "Symbols", noremap = false },
	}
end

return M
