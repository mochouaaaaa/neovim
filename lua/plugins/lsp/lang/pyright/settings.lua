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
			inlayHints = {
				functionReturnTypes = true,
				variableTypes = true,
			},
		},
	},
}
