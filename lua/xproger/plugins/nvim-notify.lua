return {
    "rcarriga/nvim-notify",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "lewis6991/gitsigns.nvim",
    },
    version = "^3.0.0",
    opts = {},
    config = function(LazyPlugins, opts)
        local notify = require("notify")
        local telescope = require("telescope")

        notify.setup(opts)
        vim.notify = notify
        telescope.load_extension("notify")
    end,
}
