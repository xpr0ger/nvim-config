return {
	{ "<leader>lG", "", desc = "Go (Gopher)" },
	{ "<leader>lGt", "<cmd>GoTagAdd json<cr>", desc = "Add JSON tags", ft = "go" },
	{ "<leader>lGT", "<cmd>GoTagRm json<cr>", desc = "Remove JSON tags", ft = "go" },
	{
		"<leader>lGi",
		function()
			vim.ui.input({ prompt = "Receiver (e.g. s *Server): " }, function(receiver)
				if receiver == nil or receiver == "" then
					return
				end
				vim.ui.input({ prompt = "Interface (e.g. io.Reader): " }, function(interface)
					if interface == nil or interface == "" then
						return
					end
					vim.cmd(string.format("GoImpl %s %s", receiver, interface))
				end)
			end)
		end,
		desc = "Implement interface",
		ft = "go",
	},
	{ "<leader>lGc", "<cmd>GoCmt<cr>", desc = "Generate comment", ft = "go" },
	{ "<leader>lGe", "<cmd>GoIfErr<cr>", desc = "Generate if err", ft = "go" },
	{ "<leader>lGm", "<cmd>GoMod tidy<cr>", desc = "Go mod tidy", ft = "go" },
}
