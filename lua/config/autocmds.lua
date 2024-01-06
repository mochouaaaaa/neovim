-- copilot proxy
local ok, _ = pcall(require, "copilot")
if ok then
	vim.g.copilot_proxy = false
end

vim.cmd([[let &t_Cs = "\e[4:3m]"]])
vim.cmd([[let &t_Ce = "\e[4:0m]"]])

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_auto_diag", { clear = true }),
	callback = function(args)
		-- the buffer where the lsp attached
		---@type number
		local buffer = args.buf

		-- create the autocmd to show diagnostics
		vim.api.nvim_create_autocmd("CursorHold", {
			group = vim.api.nvim_create_augroup("_auto_diag", { clear = true }),
			buffer = buffer,
			callback = function()
				local opts = {
					focusable = false,
					close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					border = "rounded",
					source = "always",
					prefix = " ",
					scope = "cursor",
				}
				vim.diagnostic.open_float(nil, opts)
			end,
		})
	end,
})
