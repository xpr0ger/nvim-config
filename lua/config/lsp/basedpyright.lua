return function()
	return {
		settings = {
			basedpyright = {
				analysis = {
					autoImportCompletions = true,
					typeCheckingMode = "basic",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "openFilesOnly",
				},
			},
		},
	}
end
