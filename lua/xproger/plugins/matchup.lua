return {
    "andymass/vim-matchup",
    opts = {},
    config = function(LazyPlugins, opts)
        require("match-up").setup(opts)
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
}
