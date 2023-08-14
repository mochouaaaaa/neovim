return {
	{
		"/",
		function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = true,
			}))
		end,
	},
	{
		"<leader>th",
		"<Cmd>Telescope help_tags<CR>",
		desc = " Check out all tags",
	},
	{
		"<leader>tH",
		"<Cmd>Telescope highlights<CR>",
		desc = "[] Check out all highlights",
	},
	{
		"<leader>tgi",
		"<Cmd>Telescope git_files<CR>",
		desc = "[]Search Git File",
	},
	{
		"<leader>tgf",
		"<Cmd>Telescope live_grep<CR>",
		desc = " Search text in cucurrent directory",
	},
	{
		"<C-f>",
		"<Cmd>Telescope find_files<CR>",
		desc = ".* Search files cucurrent directory",
	},
	{
		"<leader>ts",
		"<Cmd>Telescope spell_suggest<CR>",
		desc = "益spell suggestions about cursor word",
	},
	{
		"<leader>tre",
		"<Cmd>Telescope treesitter<CR>",
		desc = "滑Have a look at the tags provided by 滑",
	},
	{
		"<leader>te",
		"<Cmd>Telescope diagnostics<CR>",
		desc = " take a look",
	},
	{
		"<C-p>",
		"<cmd>lua require('telescope.builtin').commands()<cr>",
		desc = "查询所有的command命令",
	},
	{
		"<leader>tj",
		"<Cmd>Telescope jumplist<CR>",
		desc = " Get jumplist",
	},
	{
		"<leader>tk",
		"<Cmd>Telescope keymaps<CR>",
		desc = " Check out keymaps[S-C-/]",
	},
}
