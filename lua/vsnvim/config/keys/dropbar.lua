local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{
			"<leader>;",
			action("breadcrumbs.focusAndSelect"),
			desc = "Pick symbols in winbar",
		},
		{
			"[;",
			action("breadcrumbs.focusPrevious"),
			desc = "Go to previous breadcrumb",
		},
		{
			"];",
			action("breadcrumbs.focusNext"),
			desc = "Select next breadcrumb",
		},
	}
end

return M
