return {
    "jay-babu/mason-null-ls.nvim",
    version = "^2.0.0",
    dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim",
    },
    opts = {
        ensure_installed = {
            "stylua",
            "cspell",
            "golangci_lint",
            "json",
            "yaml",
            "sonarlint_language_server",
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
        },
        handlers = {
            goimports_reviser = function(_, _)
                local null_ls = require("null-ls")
                null_ls.register(null_ls.builtins.formatting.goimports_reviser.with({
                    args = {
                        "-rm-unused",
                        "-company-prefixes",
                        require("xproger.utils.golang").get_package_domain(),
                        "$FILENAME",
                    },
                }))
            end,
        },
    },
    priority = 41,
}
