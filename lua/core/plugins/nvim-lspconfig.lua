local function lsp_bindings_global(telescope_builtin)
    return {
        l = {
            name = "LSP",
            d = { telescope_builtin.diagnostics, "Diagnostic window", noremap = false },
            ["[d"] = { vim.diagnostic.goto_prev, "Go to prev issue", noremap = false },
            ["]d"] = { vim.diagnostic.goto_next, "Go to next issue", noremap = false },
            q = { vim.diagnostic.setloclist, "Open loclist", noremap = false },
        },
    }
end

local function lsp_bindings(buffer, telescope_builtin)
    return {
        l = {
            name = "LSP",
            g = {
                name = "Go To",
                D = { vim.lsp.buf.declaration, "Go To Declaration", noremap = false, buffer = buffer },
                d = { telescope_builtin.lsp_definitions, "Go To Definition", noremap = false, buffer = buffer },
                t = {
                    telescope_builtin.lsp_type_definitions,
                    "Go To Type Definition",
                    noremap = false,
                    buffer = buffer,
                },
                r = { telescope_builtin.lsp_references, "Go To References", noremap = false, buffer = buffer },
                i = { telescope_builtin.lsp_implementations, "Go To Implementation", noremap = false, buffer = buffer },
                c = {
                    name = "Calls",
                    i = {
                        telescope_builtin.lsp_incoming_calls,
                        "List incoming class",
                        noremap = false,
                        buffer = buffer,
                    },
                    o = {
                        telescope_builtin.lsp_outgoing_calls,
                        "List outgoing class",
                        noremap = false,
                        buffer = buffer,
                    },
                },
            },

            h = { vim.lsp.buf.hover, "Hover", noremap = false, buffer = buffer },
            S = { vim.lsp.buf.signature_help, "Signature Help", noremap = false, buffer = buffer },
            s = {
                name = "Symbols",
                d = { telescope_builtin.lsp_document_symbols, "Document symbols", noremap = false, buffer = buffer },
                w = {
                    telescope_builtin.lsp_dynamic_workspace_symbols,
                    "Workspace symbols",
                    noremap = false,
                    buffer = buffer,
                },
            },
            w = {
                Name = "Workspace",

                a = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder", noremap = false, buffer = buffer },
                r = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder", noremap = false, buffer = buffer },
                l = {
                    function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end,
                    "Remove Workspace Folder",
                    noremap = false,
                    buffer = buffer,
                },
            },
            a = {
                name = "Action",

                r = { vim.lsp.buf.rename, "Rename symbol", noremap = false, buffer = buffer },
                c = { vim.lsp.buf.code_action, "Code Actions", noremap = false, buffer = buffer },
                f = {
                    function()
                        vim.lsp.buf.format({ async = true })
                    end,
                    "Format",
                    noremap = false,
                    buffer = buffer,
                },
            },
        },
    }
end

local binding_opts = {
    prefix = "<leader>",
}

return {
    "neovim/nvim-lspconfig",
    priority = 40,
    config = function()
        local wk = require("which-key")
        local telescope_builtin = require("telescope.builtin")
        wk.register(lsp_bindings_global(telescope_builtin), binding_opts)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                wk.register(lsp_bindings(ev.buf, telescope_builtin), binding_opts)
            end,
        })
    end,
}
