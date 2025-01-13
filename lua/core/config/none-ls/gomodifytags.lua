return function()
    local null_ls = require("null-ls")

    null_ls.register(null_ls.builtins.code_actions.gomodifytags.with({
        generator_opts = {
            command = "gomodifytags",
            args = { "-quiet", "-transform", "camelcase" },
        },
    }))
end
