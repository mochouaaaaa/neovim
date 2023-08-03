-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
	{
		"christoomey/vim-tmux-navigator",
	},
	{
		"nathom/filetype.nvim",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("filetype").setup({
				overrides = {
					extensions = {
						h = "cpp",
					},
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		cmd = { "TroubleToggle", "Trouble", "TroubleRefresh" },
		config = function()
			require("trouble").setup()
		end,
	},
	{
		"rmagatti/goto-preview",
		lazy = true,
		keys = { "gp" },
		config = function()
			require("goto-preview").setup({
				width = 120,
				height = 25,
				default_mappings = true,
				debug = false,
				opacity = nil,
				post_open_hook = nil,
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	{
		"uga-rosa/translate.nvim",
		config = function()
			local default_command = "google"
			require("translate").setup({
				default = {
					command = default_command,
				},
				-- preset = {
				-- 	output = {
				-- 		floating = {
				-- 			border = "none",
				-- 		},
				-- 	},
				-- },
			})
		end,
		keys = {
			{
				"<leader>tt",
				"<cmd>Translate ZH<CR>",
				mode = { "n", "x" },
				desc = "翻译",
			},
			{
				"<leader>tr",
				"<cmd>Translate ZH --output=replace<CR>",
				mode = { "n", "x" },
				desc = "翻译并替换文本",
			},
		},
	},
	-- 在"dd"等不希望将内容复制到系统剪贴板的时候不复制到系统剪贴板。支持在SSH等情况复制到系统剪贴板。
	{
		"ibhagwan/smartyank.nvim",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("smartyank").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
			--   local wk = require('which-key')
			--   wk.register({
			--     f = {
			--       name = 'Telescope Finder',
			--       i = { name = 'BuildIn | Reloader' },
			--       m = { name = 'Mark' },
			--       h = { name = 'History | Help | Highlight' },
			--       w = { name = 'Workspace | LSP Action' },
			--       s = { name = 'Spectre' },
			--     },
			--     c = { name = 'Code' },
			--     d = { name = 'DAP' },
			--     o = { name = 'Orgmode' },
			--     m = { name = 'Markdown | Format | Marks' },
			--     r = { name = 'Rename | Rest' },
			--     s = { name = 'Source | Session' },
			--     t = { name = 'Translate' },
			--     w = { name = 'Workspace' },
			--     g = { name = 'Git' }
			--   }, { prefix = '<leader>' })
		end,
	},
}

