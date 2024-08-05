local function gitsigns_bindings_normal(gs, telescope_builtin)
    return {
        { "<leader>g",   group = "Git" },
        { "<leader>gg",  group = "Telescope" },
        { "<leader>ggc", telescope_builtin.git_commits,  desc = "Commits",  noremap = false },
        { "<leader>ggb", telescope_builtin.git_branches, desc = "Branches", noremap = false },
        { "<leader>ggs", telescope_builtin.git_status,   desc = "Status",   noremap = false },
        { "<leader>ggS", telescope_builtin.git_stashes,  desc = "Stashes",  noremap = false },

        {
            "]c",
            function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end,
            desc = "Next hunk",
            noremap = false,
        },
        {
            "[c",
            function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end,
            desc = "Prev hunk",
            noremap = false,
        },

        { "<leader>gs",  gs.stage_hunk,                desc = "Stage hunk",                noremap = false },
        { "<leader>gr",  gs.reset_hunk,                desc = "Reset hunk",                noremap = false },
        { "<leader>gS",  gs.stage_buffer,              desc = "Stage buffer",              noremap = false },
        { "<leader>gu",  gs.undo_stage_hunk,           desc = "Undo stage hunk",           noremap = false },
        { "<leader>gR",  gs.reset_buffer,              desc = "Reset buffer",              noremap = false },
        { "<leader>gi",  gs.select_hunk,               desc = "Select hunk",               noremap = false },
        { "<leader>gtb", gs.toggle_current_line_blame, desc = "Toggle current line blame", noremap = false },
        { "<leader>gtd", gs.toggle_deleted,            desc = "Toggle deleted",            noremap = false },
        {
            "<leader>gb",
            function()
                gs.blame_line({ full = true })
            end,
            desc = "Blame current line",
            noremap = false,
        },
        {
            "<leader>gd",
            function()
                gs.diffthis("~")
            end,
            desc = "Diff current file",
            noremap = false,
        },
    }
end

return {
    "lewis6991/gitsigns.nvim",
    opts = {},
    config = function(_, opts)
        local gs = require("gitsigns")
        local wk = require("which-key")
        local telescope_builtin = require("telescope.builtin")
        wk.add(gitsigns_bindings_normal(gs, telescope_builtin))
        gs.setup(opts)
    end,
}
