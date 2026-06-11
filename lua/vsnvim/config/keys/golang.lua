local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>lG",  group = "Go (Gopher)" },
		{ "<leader>lGt", action("go.add.tags"),    desc = "Add JSON tags",       ft = "go" },
		{ "<leader>lGT", action("go.remove.tags"), desc = "Remove JSON tags",    ft = "go" },
		{ "<leader>lGi", action("go.impl.cursor"), desc = "Implement interface", ft = "go" },
		{ "<leader>lGc", action("go.add.tags"),    desc = "Generate comment",    ft = "go" },
		{ "<leader>lGm", action("go.tools.tidy"),  desc = "Go mod tidy",         ft = "go" },
	}
end

return M
