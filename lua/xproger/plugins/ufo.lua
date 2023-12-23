return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    opts = {},
    config = function(_, opts)
        local ufo = require("ufo")
        local wk = require("which-key")

        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        ufo.setup(opts)
        wk.register({
            K = {
                function()
                    local winId = ufo.peekFoldedLinesUnderCursor()
                    if not winId then
                        vim.lsp.buf.hover()
                    end
                end,
                "Hover",
                noremap = false,
            },
            z = {
                R = {
                    ufo.openAllFolds,
                    "Open all folds",
                    noremap = false,
                },
                M = {
                    ufo.closeAllFolds,
                    "Close all folds",
                    noremap = false,
                },
                r = {
                    ufo.openFoldsExceptKinds,
                    "Fold less",
                    noremap = false,
                },
                m = {
                    ufo.closeFoldsWith,
                    "Fold more",
                    noremap = false,
                },
            },
        }, {})
    end,
}
