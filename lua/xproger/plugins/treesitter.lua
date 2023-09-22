return {
    "nvim-treesitter/nvim-treesitter",
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
        },
    },
    config = function(LazyPlugins, opts)
        ts_config = require("nvim-treesitter.configs")
        ts_config.setup(opts)
    end,
}
