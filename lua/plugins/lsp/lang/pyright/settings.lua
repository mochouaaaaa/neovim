return {
	pyright = {
		python = {
			analysis = {
				autoSearchPaths = true,
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
				diagnosticSeverityOverrides = {
					-- https://microsoft.github.io/pyright/#/configuration?id=diagnostic-rule-defaults
					reportMissingImports = "error",
					reportUndefinedVariable = "none",
				},
				typeCheckingMode = "on",
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
