local border_opts = {
    border = "rounded",
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
}

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "golang/vscode-go",
    },
    config = function()
        local cmp = require("cmp")
        -- TODO: Move to the dedicated plugin property
        local opts = {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(border_opts),
                documentation = cmp.config.window.bordered(border_opts),
            },
            mapping = {
                ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000 },
                { name = "lazydev",  priority = 850 },
                { name = "vsnip",    priority = 750 },
                { name = "buffer",   priority = 500 },
                { name = "path",     priority = 500 },
            }),
        }

        -- General setup, cannot be moved to ops due to self referencing
        cmp.setup(opts)

        -- Git commit autocompletion
        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
            }, { { name = "buffer" } }),
        })

        -- Search auto complete
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Command autocompletion
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" }, { name = "cmdline" } }),
        })
    end,
}
