return function()
    local defaultConfig = require("core.config.lsp.default")()

    defaultConfig["settings"] = {
        gopls = {
            buildFlags = { require("core.config.golang").build_tags },
            gofumpt = true,
            usePlaceholders = true,
            symbolScope = "workspace",
            ["local"] = require("core.utils").get_local_imports_prefix(),
        },
    }
    return defaultConfig
end
