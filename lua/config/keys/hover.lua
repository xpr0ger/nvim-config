local M = {}

M.get_global_bindings = function()
	return {
		{ "<leader>l", group = "LSP" },
		{
			"<leader>lh",
			function()
				require("hover").hover()
			end,
			desc = "Hover",
			noremap = false,
		},
		{
			"<leader>lH",
			function()
				require("hover").hover_select()
			end,
			desc = "Select hover provider",
			noremap = false,
		},
	}
end

return M
