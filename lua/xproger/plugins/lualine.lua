local test = {}
test["neo-tree"] = ""
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "RRethy/nvim-base16",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            icons_enabled = true,
            theme = "material",
            component_separators = { left = " ", right = " " },
            section_separators = { left = " ", right = " " },
            disabled_filetypes = {
                "neo-tree",
            },
        },
        -- OR in winbar
        winbar = {
            lualine_c = {
                {
                    "navic",
                    color_correction = nil,
                    navic_opts = nil,
                },
            },
        },
        tabline = {
            lualine_a = {
                {
                    "buffers",
                    symbols = {
                        alternate_file = " ", -- Text to show to identify the alternate file
                    },
                },
            },
        },
    },
    config = function(LazyPlugins, opts)
        lualine = require("lualine")
        lualine.setup(opts)
    end,
}
