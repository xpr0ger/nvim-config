return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "^3.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {
        sources = { "filesystem", "git_status", "buffers", "document_symbols" },
        filesystem = {
            use_libuv_file_watcher = true,
            follow_current_file = {
                enabled = true,
                leave_dirs_open = true,
            },
            group_empty_dirs = true,
        },
    },
    config = function(LazyPlugins, opts)
        require("neo-tree").setup(opts)
        wk = require("which-key")
        wk.register({
            e = {
                name = "Explore",
                t = { "<cmd>Neotree filesystem toggle<cr>", "Toggle", noremap = false },
                f = { "<cmd>Neotree filesystem focus<cr>", "Focus", noremap = false },
                g = { "<cmd>Neotree git_status float<cr>", "Git", noremap = false },
                b = { "<cmd>Neotree buffers float<cr>", "Buffers", noremap = false },
                s = { "<cmd>Neotree document_symbols float<cr>", "Symbols", noremap = false },
            },
        }, { prefix = "<leader>" })
    end,
}
