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
            "tsserver",
            "cssls",
            "templ",
            "dockerls",
            "htmx",
            "docker_compose_language_service",
            "tailwindcss",
        },
    },
    config = function(_, opts)
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup(opts)

        local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        cmp_caps.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        mason_lspconfig.setup_handlers({
            function(server_name)
                local lsp_configs = require("core.config.lsp")
                local config_fn = lsp_configs[server_name] or lsp_configs["default"]
                lspconfig[server_name].setup(config_fn())
            end,
        })
    end,
    priority = 41,
}
