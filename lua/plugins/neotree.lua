return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = require("config.keys.neotree"),
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		sources = { "filesystem", "git_status", "buffers", "document_symbols" },
		filesystem = {
			use_libuv_file_watcher = true,
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
			group_empty_dirs = true,
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function(_)
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
}
