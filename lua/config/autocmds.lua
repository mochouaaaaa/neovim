-- lua 文件自动格式化
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		vim.b.autoformat = true
	end,
})
