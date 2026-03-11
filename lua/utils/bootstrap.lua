local M = {}

function M.bootstrap()
	package.path = package.path .. ";" .. vim.fn.expand("$HOME/.luarocks/share/lua/5.1/?.lua")
	package.cpath = package.cpath .. ";" .. vim.fn.expand("$HOME/.luarocks/lib/lua/5.1/?.so")
	require("config.options")
	require("config.keymaps")
end

function M.ensure_rocks(...)
	for _, item in ipairs({ ... }) do
		local status, _ = pcall(require, item.package)
		if not status then
			vim.fn.system({ "luarocks", "--local", "--lua-version", "5.1", "install", item.name })
			vim.notify("Installing lua rock " .. item.name .. ". Restart neovim")
		end
	end
end

return M
