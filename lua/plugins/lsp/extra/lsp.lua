local M = {
	"neovim/nvim-lspconfig", -- official lspconfig
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
}

function M.config()
	local lspconfig = require("lspconfig")

	local common = require("plugins.lsp.lang.common")
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			local lsp_config_path = "plugins.lsp.lang." .. server_name
			local capabilities = common.make_capabilities()
			local config = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					common.setup(client, bufnr)
					if pcall(require, lsp_config_path) and require(lsp_config_path).attach ~= nil then
						require(lsp_config_path).attach(client, bufnr)
					end
				end,
			}
			local settings = lsp_config_path .. ".settings"
			if pcall(require, settings) then
				config.settings = require(settings)
			end
			lspconfig[server_name].setup(config)
		end,
	})
end

return M
