local M = {}

local function action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

M.get_bindings = function()
	return {
		{ "<leader>lpv", action("python.setInterpreter"), desc = "Select VirtualEnv", ft = "python" },
	}
end

return M
