local function global_bindings(builtin)
    return {
        f = {
            name = "Find (Telescope)",
            f = { builtin.find_files, "File", noremap = false },
            w = { builtin.live_grep, "Word", noremap = false },
            b = { builtin.buffers, "Buffers", noremap = false },
            h = { builtin.help_tags, "Help", noremap = false },
            W = { builtin.string_grep, "Current word", noremap = false },
        },
    }
end

local opts_bindings = { prefix = "<leader>" }

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "0.1.x",
    opts = {},
    config = function(_, opts)
        require("telescope").setup(opts)
        local wk = require("which-key")
        local builtin = require("telescope.builtin")

        wk.register(global_bindings(builtin), opts_bindings)
    end,
}
