local function with_current_word(fn)
    return function()
        fn({ default_text = vim.fn.expand("<cword>") or "" })
    end
end

local function global_bindings(builtin)
    return {
        { "<leader>f",  group = "Find (Telescope)" },
        { "<leader>ff", builtin.find_files,                   desc = "Files",    noremap = false },
        { "<leader>fw", with_current_word(builtin.live_grep), desc = "Word",    noremap = false },
        { "<leader>fb", builtin.buffers,                      desc = "Buffers", noremap = false },
        { "<leader>fh", builtin.help_tags,                    desc = "Help",    noremap = false },
        {
            "<leader>fW",
            with_current_word(builtin.grep_string),
            desc = "Current word",
            noremap = false,
        },
    }
end

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

        wk.add(global_bindings(builtin))
    end,
}
