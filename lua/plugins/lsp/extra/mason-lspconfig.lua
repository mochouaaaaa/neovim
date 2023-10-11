local M = {
	"williamboman/mason-lspconfig.nvim",
	cmd = "LspInstall",
}

function M.config()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"rust_analyzer",
			"gopls",
			"clangd",
			-- "pylyzer",
			"pyright",
		},
		automatic_installation = true,
	})
end

return M
