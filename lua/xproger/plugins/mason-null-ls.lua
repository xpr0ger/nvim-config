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
        },
        handlers = {},
    },
    priority = 41,
}
