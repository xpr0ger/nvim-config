local function lsp_bindings_global()
	return {
		l = {
			name = "LSP",
			d = { vim.diagnostic.open_float, "Diagnostic window", noremap = false },
			["[d"] = { vim.diagnostic.goto_prev, "Go to prev issue", noremap = false },
			["]d"] = { vim.diagnostic.goto_next, "Go to next issue", noremap = false },
			q = { vim.diagnostic.setloclist, "Open loclist", noremap = false },
		},
	}
end

local function lsp_bindings(buffer)
	return {
		l = {
			name = "LSP",
			g = {
				name = "Go To",
				D = { vim.lsp.buf.declaration, "Go To Declaration", noremap = false, buffer = buffer },
				d = { vim.lsp.buf.definition, "Go To Definition", noremap = false, buffer = buffer },
				["dt"] = { vim.lsp.buf.type_definition, "Go To Type Definition", noremap = false, buffer = buffer },
				r = { vim.lsp.buf.references, "Go To References", noremap = false, buffer = buffer },
				i = { vim.lsp.buf.implementation, "Go To Implementation", noremap = false, buffer = buffer },
			},

			h = { vim.lsp.buf.hover, "Hover", noremap = false, buffer = buffer },
			s = { vim.lsp.buf.signature_help, "Signature Help", noremap = false, buffer = buffer },
			w = {
				Name = "Workspace",

				s = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder", noremap = false, buffer = buffer },
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
		wk.register(lsp_bindings_global(), binding_opts)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- TODO: Check if it will conflicting
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
				wk.register(lsp_bindings(ev.buf), binding_opts)
			end,
		})
	end,
}
