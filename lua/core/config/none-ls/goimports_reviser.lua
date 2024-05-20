return function()
    local null_ls = require("null-ls")
    null_ls.register(null_ls.builtins.formatting.goimports_reviser.with({
        args = {
            "-company-prefixes",
            require("core.utils").get_local_imports_prefix(),
            "-project-name",
            require("core.utils").get_go_project_name(),
            "-format",
            "$FILENAME",
        },
    }))
end
