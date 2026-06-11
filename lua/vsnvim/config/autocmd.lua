-- Enable treesitter auto-installation for all supported filetypes automatically
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreesitterAutoStartVSCode", { clear = true }),
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		local lang = vim.treesitter.language.get_lang(ft) or ft

		local ok, parsers = pcall(require, "nvim-treesitter.parsers")
		if not ok or not parsers[lang] then
			return
		end

		local ts_config = require("nvim-treesitter.config")
		local installed = ts_config.get_installed("parsers")
		if not vim.tbl_contains(installed, lang) then
			vim.notify(
				"Treesitter parser for current file type '" .. lang .. "' will be installed.",
				vim.log.levels.WARN
			)

			local ts = require("nvim-treesitter")
			ts.install(lang)

			return
		end

		-- No `vim.treesitter.start` here because we don't want TS syntax highlighting, VSCode handles it.
		-- Treesitter is kept loaded purely for textobjects parsing!
	end,
})
