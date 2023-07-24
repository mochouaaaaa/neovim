-- lua 文件自动格式化
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		vim.b.autoformat = true
	end,
})

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

