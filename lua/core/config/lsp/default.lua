local navic = require("nvim-navic")
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
cmp_caps.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

return function()
    return {
        on_attach = function(client, buffer)
            navic.attach(client, buffer)
        end,
        capabilities = cmp_caps,
    }
end
