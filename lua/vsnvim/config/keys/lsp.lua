local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>l",   group = "LSP" },
		{ "<leader>ld",  action("workbench.action.problems.focus"),  desc = "Diagnostic window",    noremap = false },
		{ "<leader>lg",  group = "Go To" },

		{ "[d",          action("editor.action.marker.prev"),        desc = "Go to prev issue",     noremap = false },
		{ "]d",          action("editor.action.marker.next"),        desc = "Go to next issue",     noremap = false },

		{ "<leader>lgd", action("editor.action.revealDefinition"),   desc = "Go To Definition",     noremap = false },
		{ "<leader>lgi", action("editor.action.goToImplementation"), desc = "Go To Implementation", noremap = false },
		{ "<leader>lgr", action("editor.action.goToReferences"),     desc = "Go To References",     noremap = false },

		{ "<leader>la",  group = "Actions" },
		{ "<leader>lar", action("editor.action.rename"),             desc = "Rename symbol",        noremap = false },
		{ "<leader>lac", action("editor.action.quickFix"),           desc = "Code Actions",         noremap = false },
		{ "<leader>laf", action("editor.action.formatDocument"),     desc = "Format",               noremap = false },
		{ "<leader>lao", action("editor.action.organizeImports"),    desc = "Organize Imports",     noremap = false },
	}
end

return M
