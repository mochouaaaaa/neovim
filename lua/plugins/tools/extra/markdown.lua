local M = {
	{
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
				["<leader>m"] = {
					name = "+markdown?",
					["k"] = {
						name = "+markdown",
						s = { "<Cmd>MarkdownPreview<CR>", "markdown server start" },
						t = { "<Cmd>MarkdownPreviewStop<CR>", "markdown server stop" },
						l = { "<Cmd>MarkdownPreviewToggle<CR>", "markdown server toggle" },
					},
				},
			})
		end,
	},
	-----------------------------
	{
		"lukas-reineke/headlines.nvim",
		ft = { "markdown", "md", "norg" },
		config = function()
			require("headlines").setup({})
			local set_hl = vim.api.nvim_set_hl
			set_hl(0, "CodeBlock", { bg = "NONE" })
			-- for i, color in ipairs {
			--     { fg = '#a6d189', bg = 'NONE' },
			--     { fg = '#8caaee', bg = 'NONE' },
			--     { fg = '#e78284', bg = 'NONE' },
			--     { fg = '#ca9ee6', bg = 'NONE' },
			--     { fg = '#e5c890', bg = 'NONE' },
			--     { fg = '#babbf1', bg = 'NONE' },
			-- } do set_hl(0, 'Headline' .. i, color) end
			-- set_hl(0, 'Headline', { link = 'Headline1' })
		end,
	},
}

return M
