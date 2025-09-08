return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
        ensure_installed = {
            "lua_ls",
            "vimls",
            "gopls",
            "jsonls",
            "bashls",
            "html",
            "ts_ls",
            "cssls",
            "templ",
            "dockerls",
            "htmx",
            "docker_compose_language_service",
            "tailwindcss",
            -- See https://github.com/sqls-server/sqls?tab=readme-ov-file#configuration-methods
            "sqls",
            "clangd",
            "cmake",
        },
    },
    config = function(_, opts)
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup(opts)

        local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

        cmp_caps.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        local lsp_configs = require("core.config.lsp")
        for lsp_server_name, lsp_server_config_fn in pairs(lsp_configs) do
            vim.lsp.config(lsp_server_name, lsp_server_config_fn())
        end
    end,
    priority = 41,
}
