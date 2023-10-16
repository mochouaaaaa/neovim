local opt = { noremap = true, silent = true }

local function setmap(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
end

-- -------- 插入模式 ---------- ---
setmap("i", "kj", "<ESC>")

-- 退出
setmap("n", "q", ":q<CR>")
setmap("n", "qq", ":q!<CR>")
setmap("n", "Q", ":qa!<CR>")

-- insert 模式下，跳到行首行尾
setmap("i", "<A-h>", "<ESC>I")
setmap("i", "<A-l>", "<ESC>A")
setmap("i", "<A-left>", "<ESC>I")
setmap("i", "<A-right>", "<ESC>A")

-- ------ 视图模式
-- 单行或多行移动
setmap("v", "J", ":m '>+1<CR>gv=gv")
setmap("v", "K", ":m '<-2<CR>gv=gv")
setmap("v", "H", "<gv")
setmap("v", "L", ">gv")

-- 正常模式
-- 窗口
setmap("n", "<leader>|", "<C-w>v") -- 垂直新增窗口
setmap("n", "<leader>_", "<C-w>s") -- 水平新增窗口
setmap("n", "<C-w>", "<Cmd>BufferLineCloseOther<CR>")
setmap("n", "sc", "<C-w>c") -- 关闭当前窗口
setmap("n", "so", "<C-w>o") -- 关闭其他窗口
-- alt + hjkl 在窗口之间跳转
setmap("n", "<A-left>", "<C-w>h")
setmap("n", "<A-down>", "<C-w>j")
setmap("n", "<A-up>", "<C-w>k")
setmap("n", "<A-right>", "<C-w>l")
setmap("n", "<A-h>", "<C-w>h")
setmap("n", "<A-j>", "<C-w>j")
setmap("n", "<A-k>", "<C-w>k")
setmap("n", "<A-l>", "<C-w>l")

-- 取消高亮
setmap("n", "<leader>nh", "<Cmd>nohl<CR>")
