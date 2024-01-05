return {
	["rust-analyzer"] = {
		cargo = {
			allFeatures = { allFeatures = true },
			proMacro = { enabled = true },
			checkOnSave = { command = "clippy" },
		},
	},
}
