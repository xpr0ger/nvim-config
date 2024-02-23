return function()
    local defaultConfig = require("core.config.lsp.default")()
    defaultConfig["filetypes"] = { "html", "templ" }

    return defaultConfig
end
