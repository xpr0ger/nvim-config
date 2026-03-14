return function()
	return {
		on_attach = function(client, _)
			-- Disable hover in ruff, as we use basedpyright for that
			if client.name == "ruff" then
				client.server_capabilities.hoverProvider = false
			end
		end,
	}
end
