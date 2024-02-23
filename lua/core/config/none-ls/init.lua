local goimports_reviser = require("core.config.none-ls.goimports_reviser")
local cspell = require("core.config.none-ls.cspell")
local markuplint = require("core.config.none-ls.markuplint")
local config = {
    ["goimports_reviser"] = goimports_reviser,
    ["cspell"] = cspell,
    ["markuplint"] = markuplint,
}

return config
