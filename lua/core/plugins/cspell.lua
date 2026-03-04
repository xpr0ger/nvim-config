return {
    "davidmh/cspell.nvim",
    dependencies = {
        "nvimtools/none-ls.nvim",
    },
    config = function()
        local cspell = require("cspell")
        local null_ls = require("null-ls")
        local get_home_dir = function()
            return vim.env.HOME .. "/cspell.json"
        end

        local config = {
            find_json = get_home_dir,
        }

        null_ls.register(cspell.diagnostics.with({ config = config }))
        null_ls.register(cspell.code_actions.with({ config = config }))
    end,
}
