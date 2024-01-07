return {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    opts = {
        pre_hook = function(ctx)
            local U = require("Comment.utils")

            -- Determine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.blockwise then
                location = {
                    ctx.range.srow - 1,
                    ctx.range.scol,
                }
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require("ts_context_commentstring.utils").get_visual_start_location()
            end

            return require("ts_context_commentstring").calculate_commentstring({
                key = type,
                location = location,
            })
        end,
    },

    config = function(_, opts)
        local comment = require("Comment")
        comment.setup(opts)
    end,
}
