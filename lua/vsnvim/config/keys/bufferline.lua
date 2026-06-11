local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>b", "", desc = "Buffer (Bufferline)" },
		{ "<leader>bp", action("workbench.action.showAllEditors"), desc = "Pick buffer", noremap = false },
		{ "<leader>bc", action("workbench.action.closeOtherEditors"), desc = "Close other buffers", noremap = false },
		{ "]b", action("workbench.action.nextEditor"), desc = "Next buffer", noremap = false },
		{ "[b", action("workbench.action.previousEditor"), desc = "Prev buffer", noremap = false },
	}
end

return M
