return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "RRethy/nvim-base16",
        "nvim-tree/nvim-web-devicons",
        "akinsho/bufferline.nvim",
    },
    opts = {
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "catppuccin",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },

            ignore_focus = {
                "neo-tree",
                "dapui_watches",
                "dapui_stacks",
                "dapui_breakpoints",
                "dapui_scopes",
                "dapui_console",
                "dap-repl",
                "neotest-output-panel",
                "neotest-summary",
                "TelescopePrompt",
            },
        },
        sections = {
            lualine_c = { { "filename", path = 1 } },
        },
        -- OR in winbar
        winbar = {
            lualine_a = {
                {
                    "navic",
                    color_correction = nil,
                    navic_opts = nil,
                },
            },
            lualine_z = { "hostname" },
        },
    },
}
