return {
    "neovim/nvim-lspconfig",
    priority = 40,
    config = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = buffer,
            callback = function()
                vim.lsp.buf.format({ asyc = true })
            end,
        })
    end,
}
