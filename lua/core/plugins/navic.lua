return {
    "SmiteshP/nvim-navic",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    opts = {
        lsp = {
            auto_attach = true,
            preference = {
                "vue_ls",
                "ts_ls",
            }
        },
        highlight = true,
    },
}
