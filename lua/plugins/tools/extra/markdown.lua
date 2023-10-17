local M = {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>m"] = { name = "+markdown?" },
			["<leader>mk"] = {
				name = "+markdown",
				s = { "<Cmd>MarkdownPreview<CR>", "markdown server start" },
				t = { "<Cmd>MarkdownPreviewStop<CR>", "markdown server stop" },
				l = { "<Cmd>MarkdownPreviewToggle<CR>", "markdown server toggle" },
			},
		})
	end,
}

return M
