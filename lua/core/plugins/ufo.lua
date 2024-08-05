return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    opts = {
        provider_selector = function(bufnr, filetype, buftype)
            return { "treesitter", "indent" }
        end,
    },
    config = function(_, opts)
        local ufo = require("ufo")
        local wk = require("which-key")

        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        ufo.setup(opts)
        wk.add({
            {
                { "<leader>z",  group = "UFO Folds" },
                { "<leader>zR", ufo.openAllFolds,         desc = "Open all folds",  noremap = false },
                { "<leader>zM", ufo.closeAllFolds,        desc = "Close all folds", noremap = false },
                { "<leader>zr", ufo.openFoldsExceptKinds, desc = "Fold less",       noremap = false },
                { "<leader>zm", ufo.closeFoldsWith,       desc = "Fold more",       noremap = false },
            },
        })
    end,
}
