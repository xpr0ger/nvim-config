local default_config = require("config.lsp.default")

return function()
	local config = default_config()
	config.filetypes = { "sh", "bash", "zsh", "inc" }
	return config
end
