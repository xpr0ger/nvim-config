local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
cmp_caps.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

return function()
    return {
        capabilities = cmp_caps,
    }
end
