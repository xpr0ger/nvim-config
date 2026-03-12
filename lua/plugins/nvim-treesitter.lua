return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	init = function()
		-- Enable treesitter highlighting for all supported filetypes automatically
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TreesitterAutoStart", { clear = true }),
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

				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})

		-- Neovim 0.11+ Optimized Folding
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldlevel = 99
		vim.opt.foldtext = ""
	end,
}
