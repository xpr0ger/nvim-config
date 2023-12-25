local function get_home_dir()
    return vim.env.HOME .. "/cspell.json"
end

return function()
    local null_ls = require("null-ls")
    null_ls.register(null_ls.builtins.diagnostics.cspell.with({
        config = {
            find_json = get_home_dir,
        },
    }))

    null_ls.register(null_ls.builtins.code_actions.cspell.with({
        config = {
            find_json = get_home_dir,
        },
    }))
end
