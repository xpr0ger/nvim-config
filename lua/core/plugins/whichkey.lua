return {
    "folke/which-key.nvim",
    dependencies = {
        "echasnovski/mini.nvim",
        version = false,
    },
    event = "VeryLazy",
    config = function(_, opts)
        local vk = require("which-key")
        vk.setup(opts)

        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
}
