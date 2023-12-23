return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {},
    config = function(_, opts)
        local commentstring = require("ts_context_commentstring")
        commentstring.setup(opts)
    end,
}
