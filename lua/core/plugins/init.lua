local M = {}
M.plugins = require("core.utils").load_plugins("core.plugins", "lua/core/plugins/*.lua")
return M
