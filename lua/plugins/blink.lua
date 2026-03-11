local config = require("utils.config")
return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<A-y>"] = {
				function()
					require("minuet").make_blink_map()
				end,
			},
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		sources = {
			default = function()
				local sources = { "lsp", "path", "snippets", "buffer" }
				if config.is_minuet_ai_enabled() then
					table.insert(sources, "minuet")
				end
				return sources
			end,
			providers = (function()
				local providers = {}
				if config.is_minuet_ai_enabled() then
					providers.minuet = {
						name = "minuet",
						module = "minuet.blink",
						score_offset = 8,
					}
				end
				return providers
			end)(),
		},

		signature = { enabled = true },
		completion = {
			menu = {
				border = "rounded",
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
