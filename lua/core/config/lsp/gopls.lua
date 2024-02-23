return function()
    local defaultConfig = require("core.config.lsp.default")()

    defaultConfig["settings"] = {
        gopls = {
            buildFlags = { require("core.config.golang").build_tags },
            gofumpt = true,
        },
    }
    return defaultConfig
end
