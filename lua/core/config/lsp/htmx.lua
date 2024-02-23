return function()
    local defaultConfig = require("core.config.lsp.default-no-navic")()
    defaultConfig["filetypes"] = { "html", "templ" }

    return defaultConfig
end
