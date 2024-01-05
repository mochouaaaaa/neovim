-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
	-- { "christoomey/vim-tmux-navigator" },
	-- {
	-- 	"knubie/vim-kitty-navigator",
	-- 	build = "cp ./*.py ~/.config/kitty/",
	-- },
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
	{
		-- 轻松加快 Neovim 启动时间！
		"nathom/filetype.nvim",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("filetype").setup({
				overrides = {
					extensions = {
						h = "cpp",
						py = "python",
						pyd = "python",
					},
				},
			})
		end,
	},
	{
		-- 自动记忆当前文件位置，在下次打开时定位到上次位置。
		"ethanholz/nvim-lastplace",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
				lastplace_open_folds = true,
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
}
