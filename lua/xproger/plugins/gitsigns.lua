local function gitsigns_bindings_normal(gs, telescope_builtin)
    return {
        g = {
            name = "Git",
            g = {
                name = "Telescope",
                c = { telescope_builtin.git_commits, "Commits", noremap = false },
                b = { telescope_builtin.git_branches, "Branches", noremap = false },
                s = { telescope_builtin.git_status, "Status", noremap = false },
                S = { telescope_builtin.git_stashes, "Stashes", noremap = false },
            },
            ["]c"] = {
                function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end,
                "Next hunk",
                noremap = false,
            },
            ["[c"] = {
                function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end,
                "Prev hunk",
                noremap = false,
            },
            s = { gs.stage_hunk, "Stage hunk", noremap = false },
            r = { gs.reset_hunk, "Reset hunk", noremap = false },
            S = { gs.stage_buffer, "Stage buffer", noremap = false },
            u = { gs.undo_stage_hunk, "Undo stage hunk", noremap = false },
            R = { gs.reset_buffer, "Reset buffer", noremap = false },
            p = { gs.preview_hunk, "Preview hunk", noremap = false },
            b = {
                function()
                    gs.blame_line({ full = true })
                end,
                "Blame current line",
                noremap = false,
            },
            ["tb"] = { gs.toggle_current_line_blame, "Toggle current line blame", noremap = false },
            d = { gs.diffthis, "Diff current file", noremap = false },
            D = {
                function()
                    gs.diffthis("~")
                end,
                "Diff current file",
                noremap = false,
            },
            ["td"] = { gs.toggle_deleted, "Toggle deleted", noremap = false },
            i = { gs.select_hunk, "Select hunk", noremap = false, mode = { "o", "x" } },
        },
    }
end

local function gitsigns_bindings_visual(gs)
    return {
        h = {
            name = "Git",
            s = {
                function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end,
                "Stage hunk",
                noremap = false,
                mode = "v",
            },
            r = {
                function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end,
                "Reset hunk",
                noremap = false,
                mode = "v",
            },
        },
    }
end

local binding_opts = {
    prefix = "<leader>",
}

return {
    "lewis6991/gitsigns.nvim",
    opts = {},
    config = function(LazyPlugins, opts)
        local gs = require("gitsigns")
        local wk = require("which-key")
        local telescope_builtin = require("telescope.builtin")

        wk.register(gitsigns_bindings_normal(gs, telescope_builtin), binding_opts)
        wk.register(gitsigns_bindings_visual(gs), binding_opts)

        gs.setup(opts)
    end,
}
