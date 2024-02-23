return function()
    local null_ls = require("null-ls")
    null_ls.register(null_ls.builtins.diagnostics.stylelint.with({
        command = "npx",
        args = {
            "stylelint",
            "--formatter",
            "json",
            "--stdin-filename",
            "$FILENAME",
        },
    }))

    null_ls.register(null_ls.builtins.formatting.stylelint.with({
        command = "npx",
        args = {
            "stylelint",
            "--fix",
            "--stdin",
            "--stdin-filename",
            "$FILENAME",
        },
    }))
end
