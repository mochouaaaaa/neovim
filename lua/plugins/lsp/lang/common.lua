local M = {}
local lsp_status = require("lsp-status")

function M.setup(client, bufnr)
	lsp_status.on_attach(client)
end

function M.make_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)
	return capabilities
end

return M
