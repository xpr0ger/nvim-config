return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    opts = {
        flavour = "frappe",
        term_colors = true,

        integrations = {
            cmp = true,
            gitsigns = true,
            notify = true,
            treesitter = true,
            telescope = {
                enabled = true,
            },
            neotree = true,
            dap = {
                enabled = true,
                enable_ui = true,
            },
            mason = true,
            navic = {
                enabled = true,
                custom_bg = "NONE",
            },
            neotest = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },
            ufo = true,
            which_key = true,
        },
    },
    config = function(_, opts)
        vim.cmd("colorscheme catppuccin")
        require("catppuccin").setup(opts)
    end,
}
