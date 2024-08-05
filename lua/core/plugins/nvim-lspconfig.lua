local function lsp_diagnostic_bindings(telescope_builtin)
    return {
        { "[d", vim.diagnostic.goto_prev, desc = "Go to prev issue", noremap = false },
        { "]d", vim.diagnostic.goto_next, desc = "Go to next issue", noremap = false },
    }
end

local function lsp_bindings_global(telescope_builtin)
    return {
        { "<leader>l",  group = "LSP" },
        { "<leader>ld", telescope_builtin.diagnostics, desc = "Diagnostic window", noremap = false },
        { "<leader>lD", telescope_builtin.setloclist,  desc = "Open loclist",      noremap = false },
    }
end

local function lsp_bindings(buffer, telescope_builtin)
    return {
        { "<leader>l",  group = "LSP" },
        { "<leader>lg", group = "Go To" },
        {
            "<leader>lgD",
            vim.lsp.buf.declaration,
            desc = "Go To Declaration",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lgd",
            telescope_builtin.lsp_definitions,
            desc = "Go To Definition",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lgt",
            telescope_builtin.lsp_type_definitions,
            desc = "Go To Type Definition",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lgr",
            telescope_builtin.lsp_references,
            desc = "Go To References",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lgi",
            telescope_builtin.lsp_implementations,
            desc = "Go To Implementation",
            noremap = false,
            buffer = buffer,
        },
        { "<leader>lgc", group = "Calls" },
        {
            "<leader>lgci",
            telescope_builtin.lsp_incoming_calls,
            desc = "List incoming class",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lgco",
            telescope_builtin.lsp_outgoing_calls,
            desc = "List outgoing class",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lD",
            vim.lsp.signature_help,
            desc = "Signature help",
            noremap = false,
            buffer = buffer,
        },
        { "<leader>ls",  group = "Symbols" },
        {
            "<leader>lsd",
            telescope_builtin.lsp_document_symbols,
            desc = "Document symbols",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lsw",
            telescope_builtin.lsp_dynamic_workspace_symbols,
            desc = "Workspace symbols",
            noremap = false,
            buffer = buffer,
        },

        { "<leader>lw",  group = "Workspace" },
        {
            "<leader>lwa",
            telescope_builtin.add_workspace_folder,
            desc = "Add Workspace Folder",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lwr",
            telescope_builtin.remove_workspace_folder,
            desc = "Remove Workspace Folder",
            noremap = false,
            buffer = buffer,
        },
        {
            "<leader>lwl",
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            desc = "Remove Workspace Folder",
            noremap = false,
            buffer = buffer,
        },

        { "<leader>la",  group = "Actions" },

        { "<leader>lar", vim.lsp.buf.rename,      desc = "Rename symbol", noremap = false, buffer = buffer },
        { "<leader>lac", vim.lsp.buf.code_action, desc = "Code Actions",  noremap = false, buffer = buffer },
        {
            "<leader>laf",
            function()
                vim.lsp.buf.format({ async = true })
            end,
            desc = "Format",
            noremap = false,
            buffer = buffer,
        },
    }
end

return {
    "neovim/nvim-lspconfig",
    priority = 40,
    config = function()
        local wk = require("which-key")
        local telescope_builtin = require("telescope.builtin")
        wk.add(lsp_diagnostic_bindings(telescope_builtin))
        wk.add(lsp_bindings_global(telescope_builtin))
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                wk.add(lsp_bindings(ev.buf, telescope_builtin))
            end,
        })
    end,
}
