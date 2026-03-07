return function()
	local ok, blink = pcall(require, "blink.cmp")
	if not ok then
		return {}
	end

	local blink_caps = blink.get_lsp_capabilities()
	blink_caps.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	return {
		capabilities = blink_caps,
	}
end
