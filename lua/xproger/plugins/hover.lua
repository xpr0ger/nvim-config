return {
    "lewis6991/hover.nvim",
    opts = {
        init = function()
            require("hover.providers.lsp")
        end,
        title = true,
    },
    config = function(LazyPlugins, opts)
        local hover = require("hover")

        local wk = require("which-key")
        hover.setup(opts)

        wk.register({
            K = { hover.hover, "Hover", noremap = false },
            ["gK"] = { hover.hover_select, "Hover select", noremap = false },
        })
    end,
}
