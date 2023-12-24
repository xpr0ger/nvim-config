local m = {}

m.get_package_domain = function()
    local gomod_filepath = vim.fn.getcwd() .. "/go.mod"
    local gomod_file_pointer = io.open(gomod_filepath, "r")
    if gomod_file_pointer == nil then
        return ""
    end
    local module_line = gomod_file_pointer:read()
    return module_line:match("module (.-/.-/)")
end

return m
