return {
	"neovim/nvim-lspconfig",
	lazy = false,
	priority = 40,
	init = function()
		local ok, telescope_builtin = pcall(require, "telescope.builtin")
		if ok ~= true then
			return
		end

		local wk = require("which-key")
		local lsp_keys_config = require("config.keys.nvim-lspconfig")
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspKeysConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
				wk.add(lsp_keys_config.lsp_buffer_bindings(ev.buf, telescope_builtin))
			end,
		})
	end,
	keys = function(_, keys)
		local lsp_keys_config = require("config.keys.nvim-lspconfig")
		local ok, telescope_builtin = pcall(require, "telescope.builtin")
		if ok then
			vim.list_extend(keys, lsp_keys_config.lsp_global_bindings(telescope_builtin))
			vim.list_extend(keys, lsp_keys_config.lsp_diagnostic_bindings(telescope_builtin))
		end
		return keys
	end,
}
