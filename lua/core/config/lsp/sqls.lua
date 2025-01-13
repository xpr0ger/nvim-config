return function()
    local defaultConfig = require("core.config.lsp.default-no-navic")()
    defaultConfig["on_attach"] = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end
    return defaultConfig
end
