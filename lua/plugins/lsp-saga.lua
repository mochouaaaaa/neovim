local M = {
	"nvimdev/lspsaga.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons",
	},
}

M.keys = {
	{
		"<leader>dg",
		"<cmd>Lspsaga outline<CR>",
		mode = { "n" },
		desc = "大纲",
	},
	{
		"<leader>df",
		"<cmd>Lspsaga peek_definition<CR>",
		mode = { "n" },
		desc = "方法定义",
	},
	{
		"<leader>dc",
		"<cmd>Lspsaga hover_doc<CR>",
		mode = { "n" },
		desc = "方法文档",
	},
	{
		"<leader>rn",
		"<cmd>Lspsaga rename ++project<CR>",
		mode = { "n" },
		desc = "函数改名",
	},
	{
		"<leader>cmd",
		"<cmd>Lspsaga term_toggle<CR>",
		mode = { "n" },
		desc = "内置窗口终端",
	},
}

function M.config()
	local saga = require("lspsaga")

	saga.setup({
		symbol_in_winbar = {
			enable = true,
			color_mode = true,
			auto_preview = false, -- 自动预览
			detail = true, -- 显示详细信息
		},
		rename = {
			keys = {
				quit = "<C-c>",
			},
		},
		outline = {
			layout = "float",
		},
		finder = {
			keys = {
				close = "<C-c>",
			},
		},
		definition = {
			keys = {
				edit = "o",
			},
		},
	})
end

return M

