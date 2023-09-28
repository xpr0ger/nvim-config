local M = {}
function M.loadPlugins(prefix)
    local plugin_paths = vim.api.nvim_get_runtime_file(prefix, true)
    local plugins = {}

    for _, plugin_path in pairs(plugin_paths) do
        local plugin_name = string.match(plugin_path, ".*/(.*)%.lua$")
        if plugin_name ~= "init" then
            table.insert(plugins, require("xproger.plugins." .. plugin_name))
        end
    end
    return plugins
end

return M
