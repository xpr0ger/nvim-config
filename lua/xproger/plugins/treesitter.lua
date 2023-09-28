return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "javascript",
            "html",
            "bash",
            "go",
            "gomod",
            "gowork",
            "gosum",
            "json",
            "yaml",
            "ssh_config",
            "regex",
            "toml",
            "json",
        },
        highlight = {
            enable = true,
        },
        matchup = {
            enabled = true,
        },
        context_commentstring = {
            enabled = true,
        },
    },
    config = function(LazyPlugins, opts)
        ts_config = require("nvim-treesitter.configs")
        ts_config.setup(opts)
    end,
}
