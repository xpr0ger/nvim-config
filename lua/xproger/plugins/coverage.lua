return {
    "andythigpen/nvim-coverage",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        auto_reload = true,
        commands = true,
        summary = {
            min_coverage = 80.0,
        },
        lang = {
            go = {
                coverage_file = vim.fn.getcwd() .. "/out/cover.out",
            },
        },
    },
    -- TODO: Add bindings
}
