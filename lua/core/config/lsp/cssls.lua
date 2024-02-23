return function()
    local defaultConfig = require("core.config.lsp.default")()
    defaultConfig["handlers"] = { ["textDocument/publishDiagnostics"] = function() end }
    return defaultConfig
end
