vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.conceallevel = 0
-- opt.list = true
-- opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
opt.updatetime = 100

-- 行号
opt.relativenumber = false
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = true

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")
-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新窗口由和下
opt.splitright = true
opt.splitbelow = true

-- 搜索大小写不敏感，除非包含大写
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

opt.showmode = false

-- 当文件被外部程序修改时，自动加载
opt.autoread = true
vim.bo.autoread = true

-- 禁止创建备份文件
opt.backup = false
opt.writebackup = false
opt.swapfile = false
-- vim.cmd([[colorscheme onedark]])
--
-- 添加编码支持
opt.fileencodings = "utf-8,gbk,gb18030,gb2312,ucs-bom,cp936,big5,euc-jp,euc-kr"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
