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
        event_handlers = {
            {
                event = "file_opened",
                handler = function(_)
                    require("neo-tree.command").execute({ action = "close" })
                end,
            },
        },
    },
    config = function(_, opts)
        local neotree = require("neo-tree")
        neotree.setup(opts)

        local wk = require("which-key")
        wk.add({
            { "<leader>e",  group = "Explore" },
            { "<leader>et", "<cmd>Neotree filesystem toggle<cr>",      desc = "Toggle",  noremap = false },
            { "<leader>ef", "<cmd>Neotree filesystem focus<cr>",       desc = "Focus",   noremap = false },
            { "<leader>eg", "<cmd>Neotree git_status float<cr>",       desc = "Git",     noremap = false },
            { "<leader>eb", "<cmd>Neotree buffers float<cr>",          desc = "Buffers", noremap = false },
            { "<leader>es", "<cmd>Neotree document_symbols float<cr>", desc = "Symbols", noremap = false },
        })
    end,
}
