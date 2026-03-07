return {
	"leoluz/nvim-dap-go",
	opts = {
		dap_configurations = {
			{
				type = "go",
				name = "Attach mode",
				mode = "remote",
				request = "attach",
			},
		},
		delve = {
			build_flags = require("config.golang").build_tags,
		},
	},
}
