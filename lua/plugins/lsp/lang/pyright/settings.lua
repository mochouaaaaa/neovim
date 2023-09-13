return {
	pyright = {
		python = {
			analysis = {
				autoSearchPaths = true,
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
			sortImports = {
				path = "/Volumes/Code/tools/.pyenv/shims/isort",
			},
			formatting = {
				blackPath = "/Volumes/Code/tools/.pyenv/shims/black",
			},
			inlayHints = {
				functionReturnTypes = true,
				variableTypes = true,
			},
		},
	},
}
