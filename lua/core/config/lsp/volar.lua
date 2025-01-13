return function()
    local defaultConfig = require("core.config.lsp.default")()
    defaultConfig["init_options"] = {
        vue = { hybridMode = false },
    }

    return defaultConfig
end
