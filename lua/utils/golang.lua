local M = {}
---Extract prefix for imports grouping form go.mod if exists
---@return string
function M.get_local_imports_prefix()
	return M.get_go_project_name():match("(.-/)")
end

function M.get_go_project_name()
	local gomod_filepath = vim.fn.getcwd() .. "/go.mod"
	local gomod_file_pointer = io.open(gomod_filepath, "r")
	if gomod_file_pointer == nil then
		return ""
	end

	local module_name = ""
	for line in gomod_file_pointer:lines() do
		module_name = line:match("^module%s+(.*)$")
		if module_name then
			break
		end
	end
	gomod_file_pointer:close()
	return module_name or ""
end

M.build_tags = "-tags=tests,integration,test,mock,lasting"

return M
