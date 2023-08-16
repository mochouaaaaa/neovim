local M = {
	"folke/neoconf.nvim",
	opts = {
		import = {
			vscode = false, -- local .vscode/settings.json
			coc = false, -- global/local coc-settings.json
			nlsp = false, -- global/local nlsp-settings.nvim json settings
		},
	},
}

return M
