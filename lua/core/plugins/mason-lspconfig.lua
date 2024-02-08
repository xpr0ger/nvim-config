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
            "cssls",
            "templ",
            "denols",
            "dockerls",
            "htmx",
            "docker_compose_language_service",
        },
    },
    config = function(_, opts)
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup(opts)

        local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        local navic = require("nvim-navic")

        cmp_caps.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        mason_lspconfig.setup_handlers({
            function(server_name)
                local config = {
                    on_attach = function(client, buffer)
                        if server_name ~= "htmx" or server_name ~= "templ" then
                            navic.attach(client, buffer)
                        end
                    end,
                    capabilities = cmp_caps,
                }
                if server_name == "gopls" then
                    config["settings"] = {
                        gopls = {
                            buildFlags = { require("core.config.golang").build_tags },
                            gofumpt = true,
                        },
                    }
                end

                if server_name == "html" or server_name == "htmx" or server_name == "templ" then
                    config["filetypes"] = { "html", "templ" }
                end

                lspconfig[server_name].setup(config)
            end,
        })
    end,
    priority = 41,
}
