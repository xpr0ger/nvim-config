return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function(_)
		vim.cmd.colorscheme("catppuccin-frappe")
	end,
	opts = {
		flavour = "frappe",
		integrations = {
			alpha = true,
			bufferline = true,
			blink_cmp = true,
			indent_blankline = { enabled = true },
			dap = {
				enabled = true,
				enable_ui = true,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
				inlay_hints = {
					background = true,
				},
			},
		},
		custom_highlights = function(colors)
			return {
				DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
				DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
				DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
				DiagnosticUnderlineHint = { undercurl = true, sp = colors.teal },
			}
		end,
	},
}
