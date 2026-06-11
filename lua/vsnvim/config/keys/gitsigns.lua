local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>g", group = "Git" },
		
		{ "]c", action("workbench.action.editor.nextChange"), desc = "Next hunk", noremap = false },
		{ "[c", action("workbench.action.editor.previousChange"), desc = "Prev hunk", noremap = false },

		{ "<leader>gr", action("git.revertSelectedRanges"), desc = "Reset hunk", noremap = false },
		{ "<leader>gb", action("gitlens.toggleFileBlame"), desc = "Blame current file", noremap = false },
		{ "<leader>ggs", action("workbench.view.scm"), desc = "Git Status", noremap = false },
	}
end

return M
