local none_ls_config = require("core.config.none-ls")

return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = {
        debug = true,
        ensure_installed = {
            "stylua",
            "cspell",
            -- "golangci_lint",
            "json",
            "yaml",
            "bash",
            "go",
            "goimports-reviser",
            "golangci_lint",
            "staticcheck",
            "revive",
            "shellharden",
            "markuplint",
            "prettier",
            "stylelint",
            "jsonlint",
            "gomodifytags",
            "sqlfluff",
        },

        handlers = {
            goimports_reviser = function(_, _)
                none_ls_config.goimports_reviser()
            end,
            cspell = function(_, _)
                none_ls_config.cspell()
            end,
            markuplint = function(_, _)
                none_ls_config.markuplint()
            end,
            stylelint = function(_, _)
                none_ls_config.stylelint()
            end,
            sqlfluff = function(_, _)
                none_ls_config.sqlfluff()
            end,
            gomodifytags = function(_, _)
                none_ls_config.gomodifytags()
            end,
        },
    },
    priority = 41,
}
