return {
    "romgrk/barbar.nvim",
    enabled = false,
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        auto_hide = 1,
        tabpages = true,
        separator_at_end = false,
        preset = "powerline",
        sidebar_filetypes = {
            ["neo-tree"] = { event = "BufWipeout" },
        },
    },
    config = function(_, opts)
        local barbar = require("barbar")
        barbar.setup(opts)

        local wk = require("which-key")
        wk.register({
            t = {
                name = "Tabs",
                n = { "<cmd>BufferNext<cr>", "Next tab", noremap = false },
                p = { "<cmd>BufferPrevious<cr>", "Previous tab", noremap = false },
            },
        }, { prefix = "<leader>" })
    end,
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
