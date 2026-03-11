return {
	{
		"<leader>ll",
		function()
			require("lint").try_lint()
		end,
		desc = "Trigger linting for current file",
	},
}
