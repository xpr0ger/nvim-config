return function()
	local defaultConfig = require("config.lsp.default")()

	defaultConfig["settings"] = {
		gopls = {
			buildFlags = { require("utils.golang").build_tags },
			gofumpt = true,
			usePlaceholders = false,
			symbolScope = "workspace",
			["local"] = require("utils.golang").get_local_imports_prefix(),
		},
	}
	return defaultConfig
end
