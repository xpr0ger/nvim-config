return function()
	local defaultConfig = require("core.config.lsp.default")()
    filetypes = require("lspconfig.configs.ts_ls").default_config.filetypes
    table.insert(filetypes, 'vue')
    defaultConfig['filetypes'] = filetypes

	return defaultConfig
end
