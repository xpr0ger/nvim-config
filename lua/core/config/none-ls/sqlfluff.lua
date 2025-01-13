return function()
    local null_ls = require("null-ls")
    null_ls.register(null_ls.builtins.formatting.sqlfluff.with({
        extra_args = { "--dialect", "postgres" },
    }))
end
