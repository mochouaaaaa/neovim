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
		--         主页：https://github.com/ethanholz/nvim-lastplace
		-- 简介：自动记忆当前文件位置，在下次打开时定位到上次位置。
		"ethanholz/nvim-lastplace",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
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
		"JuanZoran/Trans.nvim",
		config = function()
			require("Trans").setup({
				strategy = {
					default = {
						backend = "baidu",
					},
				},
			})
		end,
		keys = {
			{
				"<leader>tt",
				"<cmd>Translate<CR>",
				mode = { "n", "x" },
				desc = "翻译",
			},
			{
				"<leader>tr",
				"<cmd>TranslateInput<CR>",
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
	-- 将没有使用到的变量进行暗淡处理。
	{
		"zbirenbaum/neodim",
		lazy = true,
		event = "LspAttach",
		config = function()
			require("neodim").setup({
				alpha = 0.75,
				blend_color = "#000000",
				update_in_insert = {
					enable = true,
					delay = 100,
				},
				hide = {
					virtual_text = true,
					signs = false,
					underline = false,
				},
			})
		end,
	},
	{
		"booperlv/nvim-gomove",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("gomove").setup({
				map_defaults = false,
				reindent = true,
				undojoin = true,
				move_past_end_col = false,
			})

			local map = vim.api.nvim_set_keymap
			map("n", "<M-h>", "<Plug>GoNSMLeft", { noremap = true, silent = true })
			map("n", "<M-j>", "<Plug>GoNSMDown", { noremap = true, silent = true })
			map("n", "<M-k>", "<Plug>GoNSMUp", { noremap = true, silent = true })
			map("n", "<M-l>", "<Plug>GoNSMRight", { noremap = true, silent = true })

			map("x", "<M-h>", "<Plug>GoVSMLeft", { noremap = true, silent = true })
			map("x", "<M-j>", "<Plug>GoVSMDown", { noremap = true, silent = true })
			map("x", "<M-k>", "<Plug>GoVSMUp", { noremap = true, silent = true })
			map("x", "<M-l>", "<Plug>GoVSMRight", { noremap = true, silent = true })

			map("x", "<C-h>", "<Plug>GoVSDLeft", { noremap = true, silent = true })
			map("x", "<C-j>", "<Plug>GoVSDDown", { noremap = true, silent = true })
			map("x", "<C-k>", "<Plug>GoVSDUp", { noremap = true, silent = true })
			map("x", "<C-l>", "<Plug>GoVSDRight", { noremap = true, silent = true })
		end,
	},
}
