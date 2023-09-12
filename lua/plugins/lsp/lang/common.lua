local M = {}
local lsp_status = require("lsp-status")

function M.setup(client, bufnr)
	lsp_status.on_attach(client)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_exec(
			[[
    augroup lsp_document_highlight
      autocmd! *
      autocmd CursorHold * silent! lua vim.lsp.buf.document_highlight()
      autocmd CursorHoldI * silent! lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved * silent! lua vim.lsp.buf.clear_references()
    augroup END
    ]],
			false
		)
	end
end

function M.make_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities = vim.tbl_extend("keep", capabilities or {}, lsp_status.capabilities)
	return capabilities
end

return M
