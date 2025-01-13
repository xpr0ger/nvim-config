local config = {
    ["goimports_reviser"] = require("core.config.none-ls.goimports_reviser"),
    ["cspell"] = require("core.config.none-ls.cspell"),
    ["markuplint"] = require("core.config.none-ls.markuplint"),
    ["stylelint"] = require("core.config.none-ls.stylelint"),
    ["sqlfluff"] = require("core.config.none-ls.sqlfluff"),
    ["gomodifytags"] = require("core.config.none-ls.gomodifytags"),
}

return config
