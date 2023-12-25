return function()
    local null_ls = require("null-ls")
    null_ls.register(null_ls.builtins.formatting.goimports_reviser.with({
        args = {
            "-rm-unused",
            "-company-prefixes",
            require("xproger.utils.golang").get_package_domain(),
            "$FILENAME",
        },
    }))
end
