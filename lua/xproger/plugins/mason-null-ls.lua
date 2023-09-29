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
            "revive"
        },
        handlers = {},
    },
    priority = 41,
}
