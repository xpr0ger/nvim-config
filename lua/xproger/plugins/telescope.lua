local function global_bindings(builtin)
    return {
        f = {
            name = "Find (Telescope)",
            f = { builtin.find_files, "File", noremap = false },
            w = { builtin.live_grep, "Word", noremap = false },
            b = { builtin.buffers, "Buffers", noremap = false },
            h = { builtin.help_tags, "Help", noremap = false },
            W = { builtin.string_grep, "Current word", noremap = false },
            D = { builtin.diagnostics, "Diagnostic", noremap = false },
        },
    }
end

local function lsp_bindings(builtin)
    return {
        f = {
            r = { builtin.lsp_references, "References", noremap = false },
            s = {
                name = "Symbols",
                w = { builtin.lsp_workspace_symbols, "Workspace symbols", noremap = false },
                b = { builtin.lsp_document_symbols, "Document symbols", noremap = false },
            },
            i = { builtin.lsp_implementations, "Implementations", noremap = false },
            d = {
                name = "Definitions",
                d = { builtin.lsp_definitions, "Definitions", noremap = false },
                t = { builtin.lsp_type_definitions, "Type Definitions", noremap = false },
            },
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
    config = function(LazyPlugins, opts)
        require("telescope").setup(opts)
        local wk = require("which-key")
        local builtin = require("telescope.builtin")

        wk.register(global_bindings(builtin), opts_bindings)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserTelescopeLsp", {}),
            callback = function(ev)
                wk.register(lsp_bindings(builtin), opts_bindings)
            end,
        })
    end,
}
