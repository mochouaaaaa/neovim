local mode_n = { "n" }
local mode_v = { "v" }
local mode_i = { "i" }
local mode_t = { "t" }
local mode_nv = { "n", "v" }
local mode_ni = { "n", "i" }
local opt_n = { noremap = true }
local opt_ns = { noremap = true, silent = true }
local opt_nb = { noremap = true, buffer = true }

vim.g.kitty_navigator_enable_stack_layout = true
vim.g.kitty_navigator_no_mappings = 1
local mappings = {
	-- -------- 插入模式 ---------- ---
	{ from = "jk", to = "<ESC>", mode = mode_i, opt = opt_n },

	{ from = "q", to = ":q<CR>", mode = mode_n, opt = opt_n },
	{ from = "qq", to = ":q!<CR>", mode = mode_n, opt = opt_n },
	{ from = "Q", to = ":qa!<CR>", mode = mode_n, opt = opt_n },
	{ from = "<D-s>", to = ":w<CR>", mode = mode_n, opt = opt_n },

	-- ------ 视图模式
	-- 单行或多行移动
	{ from = "J", to = ":m '>+1<CR>gv=gv", mode = mode_v, opt = opt_n },
	{ from = "K", to = ":m '<-2<CR>gv=gv", mode = mode_v, opt = opt_n },
	{ from = "H", to = "<gv", mode = mode_v, opt = opt_n },
	{ from = "L", to = ">gv", mode = mode_v, opt = opt_n },
	{ from = "<S-down>", to = ":m '>+1<CR>gv=gv", mode = mode_v, opt = opt_n },
	{ from = "<S-up>", to = ":m '<-2<CR>gv=gv", mode = mode_v, opt = opt_n },
	{ from = "<S-Tab>", to = "<gv", mode = mode_v, opt = opt_n },
	{ from = "<Tab>", to = ">gv", mode = mode_v, opt = opt_n },

	{ from = "<D-a>", to = "gg<S-v>G", mode = mode_n, opt = opt_n },

	-- insert 模式下，跳到行首行尾
	{ from = "<A-h>", to = "<ESC>I", mode = mode_i, opt = opt_n },
	{ from = "<A-l>", to = "<ESC>A", mode = mode_i, opt = opt_n },
	{ from = "<A-left>", to = "<ESC>I", mode = mode_i, opt = opt_n },
	{ from = "<A-right>", to = "<ESC>A", mode = mode_i, opt = opt_n },

	-- 正常模式
	-- 窗口
	{ from = "<leader>|", to = "<C-w>v", mode = mode_n, opt = opt_n }, -- 垂直新增窗
	{ from = "<leader>_", to = "<C-w>s", mode = mode_n, opt = opt_n }, -- 水平新增窗
	{ from = "<C-w>", to = "<Cmd>BufferLineCloseOther<CR>", mode = mode_n, opt = opt_n },
	--  关闭当前窗
	{ from = "sc", to = "<C-w>c", mode = mode_n, opt = opt_n },
	-- 关闭其他窗
	{ from = "so", to = "<C-w>o", mode = mode_n, opt = opt_n },
	-- cmd + hjkl 在窗口之间跳转
	--
	{ from = "<A-h>", to = "<C-w>h", mode = mode_n, opt = opt_n },
	{ from = "<A-j>", to = "<C-w>j", mode = mode_n, opt = opt_n },
	{ from = "<A-k>", to = "<C-w>k", mode = mode_n, opt = opt_n },
	{ from = "<A-l>", to = "<C-w>l", mode = mode_n, opt = opt_n },

	-- 代码跳转
	{ from = "<A-D-right>", to = "<C-]>", mode = mode_n, opt = opt_n },
	{ from = "<A-D-left>", to = "<C-o>", mode = mode_n, opt = opt_n },

	-- 取消高亮
	{ from = "<leader>nh", to = "<Cmd>nohl<CR>", mode = mode_n, opt = opt_n },
}

for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, mapping.opt)
end

-- local ranger1 = require("plugins.tools.ranger")
vim.api.nvim_set_keymap("n", "<D-r>", "", {
	noremap = true,
	callback = function()
		require("joshuto").joshuto()
	end,
})
