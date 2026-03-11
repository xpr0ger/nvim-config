local M = {}

M.get_bindings = function()
	return {
		{ "<leader>g", group = "Git" },
		{ "<leader>gg", group = "Telescope" },
		{
			"<leader>ggc",
			function()
				require("telescope.builtin").git_commits()
			end,
			desc = "Commits",
			noremap = false,
		},
		{
			"<leader>ggb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Branches",
			noremap = false,
		},
		{
			"<leader>ggs",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Status",
			noremap = false,
		},
		{
			"<leader>ggS",
			function()
				require("telescope.builtin").git_stashes()
			end,
			desc = "Stashes",
			noremap = false,
		},

		{
			"]c",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").next_hunk()
				end)
				return "<Ignore>"
			end,
			expr = true,
			desc = "Next hunk",
			noremap = false,
		},
		{
			"[c",
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end,
			expr = true,
			desc = "Prev hunk",
			noremap = false,
		},

		{
			"<leader>gs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "Stage hunk",
			noremap = false,
		},
		{
			"<leader>gr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset hunk",
			noremap = false,
		},
		{
			"<leader>gS",
			function()
				require("gitsigns").stage_buffer()
			end,
			desc = "Stage buffer",
			noremap = false,
		},
		{
			"<leader>gu",
			function()
				require("gitsigns").undo_stage_hunk()
			end,
			desc = "Undo stage hunk",
			noremap = false,
		},
		{
			"<leader>gR",
			function()
				require("gitsigns").reset_buffer()
			end,
			desc = "Reset buffer",
			noremap = false,
		},
		{
			"<leader>gi",
			function()
				require("gitsigns").select_hunk()
			end,
			desc = "Select hunk",
			noremap = false,
		},
		{
			"<leader>gtb",
			function()
				require("gitsigns").toggle_current_line_blame()
			end,
			desc = "Toggle current line blame",
			noremap = false,
		},
		{
			"<leader>gtd",
			function()
				require("gitsigns").toggle_deleted()
			end,
			desc = "Toggle deleted",
			noremap = false,
		},
		{
			"<leader>gb",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			desc = "Blame current line",
			noremap = false,
		},
		{
			"<leader>gd",
			function()
				require("gitsigns").diffthis("~")
			end,
			desc = "Diff current file",
			noremap = false,
		},
	}
end

return M
