vim.g.mapleader = " " -- 主键

local keymap = vim.keymap

-- -------- 插入模式 ---------- ---
keymap.set("i", "kj", "<ESC>")

-- ------ 视图模式
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "H", "<gv")
keymap.set("v", "L", ">gv")

-- 正常模式
-- 窗口
keymap.set("n", "<leader>|", "<C-w>v") -- 垂直新增窗口
keymap.set("n", "<leader>_", "<C-w>s") -- 水平新增窗口
keymap.set("n", "<C-w>", ":BufferLineCloseOther")
keymap.set("n", "sc", "<C-w>c") -- 关闭当前窗口
keymap.set("n", "so", "<C-w>o") -- 关闭其他窗口
-- alt + hjkl 在窗口之间跳转
keymap.set("n", "<A-h>", "<C-w>h")
keymap.set("n", "<A-j>", "<C-w>j")
keymap.set("n", "<A-k>", "<C-w>k")
keymap.set("n", "<A-l>", "<C-w>l")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

------ 插件
vim.g.mapleader = " " -- 主键

local keymap = vim.keymap

-- -------- 插入模式 ---------- ---
keymap.set("i", "kj", "<ESC>")

-- ------ 视图模式
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "H", "<gv")
keymap.set("v", "L", ">gv")

-- 正常模式
-- 窗口
keymap.set("n", "<leader>|", "<C-w>v") -- 垂直新增窗口
keymap.set("n", "<leader>_", "<C-w>s") -- 水平新增窗口
keymap.set("n", "<C-w>", ":BufferLineCloseOther")
keymap.set("n", "sc", "<C-w>c") -- 关闭当前窗口
keymap.set("n", "so", "<C-w>o") -- 关闭其他窗口
-- alt + hjkl 在窗口之间跳转
keymap.set("n", "<A-h>", "<C-w>h")
keymap.set("n", "<A-j>", "<C-w>j")
keymap.set("n", "<A-k>", "<C-w>k")
keymap.set("n", "<A-l>", "<C-w>l")

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

------ 插件
-- telescope

