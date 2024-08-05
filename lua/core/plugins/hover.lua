return {
    "lewis6991/hover.nvim",
    opts = {
        init = function()
            require("hover.providers.lsp")
        end,
        title = true,
    },
    config = function(_, opts)
        local hover = require("hover")

        local wk = require("which-key")
        hover.setup(opts)

        wk.add({
            { "<leader>lh", hover.hover,        desc = "Hover",                 noremap = false },
            { "<leader>lH", hover.hover_select, desc = "Select hover provider", noremap = false },
        })
    end,
}
