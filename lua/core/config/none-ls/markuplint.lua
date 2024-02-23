return function()
    local null_ls = require("null-ls")
    null_ls.register(null_ls.builtins.diagnostics.markuplint.with({
        command = "npx",
        args = {
            "markuplint",
            "--format",
            "JSON",
            "$FILENAME",
        },
    }))
end
