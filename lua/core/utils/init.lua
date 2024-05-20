M = {}

---Loads all plugins under specific runtime directory
---@param package_prefix string Will affect string for require call,
---for example if a plugin filename has name 'plugin_name' and package_prefix equal to 'package.prefix'
---then module 'package.prefix.plugin_name' will be required.
---@param path_prefix string Relative path from ~/.config/nvim where to look for plugins
---@return table loaded plugins
function M.load_plugins(package_prefix, path_prefix)
    local plugin_paths = vim.api.nvim_get_runtime_file(path_prefix, true)
    local plugins = {}

    for _, plugin_path in pairs(plugin_paths) do
        local plugin_name = string.match(plugin_path, ".*/(.*)%.lua$")
        if plugin_name ~= "init" then
            table.insert(plugins, require(package_prefix .. "." .. plugin_name))
        end
    end
    return plugins
end

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
    local module_line = gomod_file_pointer:read()
    return module_line:match("module (.*)")
end

return M
