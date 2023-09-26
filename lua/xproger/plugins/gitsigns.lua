local function gitsigns_bindings_normal(gs, buffer)
    return {
        h = {
            name = "Git",
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
                buffer = buffer,
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
                buffer = buffer,
            },
            s = { gs.stage_hunk, "Stage hunk", noremap = false, buffer = buffer },
            r = { gs.reset_hunk, "Reset hunk", noremap = false, buffer = buffer },
            S = { gs.stage_buffer, "Stage buffer", noremap = false, buffer = buffer },
            u = { gs.undo_stage_hunk, "Undo stage hunk", noremap = false, buffer = buffer },
            R = { gs.reset_buffer, "Reset buffer", noremap = false, buffer = buffer },
            p = { gs.preview_hunk, "Preview hunk", noremap = false, buffer = buffer },
            b = {
                function()
                    gs.blame_line({ full = true })
                end,
                "Blame current line",
                noremap = false,
                buffer = buffer,
            },
            ["tb"] = { gs.toggle_current_line_blame, "Toggle current line blame", noremap = false, buffer = buffer },
            d = { gs.diffthis, "Diff current file", noremap = false, buffer = buffer },
            D = {
                function()
                    gs.diffthis("~")
                end,
                "Diff current file",
                noremap = false,
                buffer = buffer,
            },
            ["td"] = { gs.toggle_deleted, "Toggle deleted", noremap = false, buffer = buffer },
            i = { gs.select_hunk, "Select hunk", noremap = false, buffer = buffer, mode = { "o", "x" } },
        },
    }
end

local function gitsigns_bindings_visual(gs, buffer)
    return {
        h = {
            name = "Git",
            s = {
                function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end,
                "Stage hunk",
                noremap = false,
                buffer = buffer,
                mode = "v",
            },
            r = {
                function()
                    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end,
                "Reset hunk",
                noremap = false,
                buffer = buffer,
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
        opts["on_attach"] = function(buffer)
            wk.register(gitsigns_bindings_normal(gs, buffer), binding_opts)
            wk.register(gitsigns_bindings_visual(gs, buffer), binding_opts)
        end
        gs.setup(opts)
    end,
}
