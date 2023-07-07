vim.g.mapleader = " " -- 主键

local keymap = vim.keymap

-- -------- 插入模式 ---------- ---
keymap.set("i", "kj", "<ESC>")


-- ------ 视图模式
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 正常模式
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
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
-- m-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 切换buffer
-- tab切换
--keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>")
--keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>")

-- lazy的keys配置很容易被覆盖 并且不知道被哪个配置给覆盖，所以设定为全局
local builtin = require('telescope.builtin')
-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- 环境里要安装ripgrep
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

