local goimports_reviser = require("xproger.plugins.none-ls.goimports_reviser")
local cspell = require("xproger.plugins.none-ls.cspell")
local config = {
    ["goimports_reviser"] = goimports_reviser,
    ["cspell"] = cspell,
}

return config
