local M = {
	"neovim/nvim-lspconfig", -- official lspconfig
	event = { "BufReadPre", "BufNewFile" },
}

function M.confiig()
	local common = require("plugins.lsp.lang.common")
	require("mason-lspconfig").setup_handlers({
		function(server_name)
			if vim.o.diff == "git" then
				return
			end
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
			require("lspconfig")[server_name].setup(config)
		end,
	})
end

return M
