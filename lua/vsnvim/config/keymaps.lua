vim.g.mapleader = " "

-- Use vscode-neovim to trigger vscode commands
local function vscode_action(cmd)
	return function()
		require("vscode").call(cmd)
	end
end

vim.keymap.set("n", "<leader>c", vscode_action("workbench.action.closeActiveEditor"), { desc = "Close current editor" })
vim.keymap.set("n", "<leader>w", vscode_action("workbench.action.files.save"), { desc = "Save buffer" })

-- Map the configuration key groups via which-key later in the plugin or lazy setup
