local M = {}

-- lazy.nvim bindings' format
M.get_global_bindings = function(builtin)
	return {
		{ "<leader>f", "", desc = "Find (Telescope)" },
		{ "<leader>ff", builtin.find_files, desc = "Files", noremap = false },
		{ "<leader>fw", builtin.live_grep, desc = "Live search", noremap = false },
		{ "<leader>fb", builtin.buffers, desc = "Buffers", noremap = false },
		{ "<leader>fh", builtin.help_tags, desc = "Help", noremap = false },
		{ "<leader>fW", builtin.grep_string, desc = "Search for current", noremap = false },
	}
end

return M
