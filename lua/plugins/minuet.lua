local config = require("utils.config")
return {
	"milanglacier/minuet-ai.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	enabled = config.is_minuet_ai_enabled(),
	opts = {
		provider = "gemini",
		provider_options = {
			gemini = {
				model = config.get_config().gemini.model,
				api_key = function()
					return config.get_config().gemini.api_key
				end,
				stream = true,
				system = {
					prompt = "You are a helpful code completion assistant. Your task is to provide concise and accurate code completions based on the provided context. Follow the user's coding style and conventions.",
				},
			},
		},
		virtual_text = {
			enabled = true,
			show_on_completion_menu = true,
		},
		throttle = 1000, -- milliseconds
	},
}
