local extr_args = {
	"--hidden", -- Search hidden files that are prefixed with `.`
	"--no-ignore", -- Don’t respect .gitignore
	"-g",
	"!.git/",
	"-g",
	"!node_modules/",
	"-g",
	"!.idea/",
	"-g",
	"!pnpm-lock.yaml",
	"-g",
	"!package-lock.json",
	"-g",
	"!go.sum",
	"-g",
	"!lazy-lock.json",
	"-g",
	"!.zsh_history",
}

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
		"<leader>tgg",
		"<Cmd>Telescope git_files<CR>",
		desc = "[]Search Git File",
	},
	{
		"<leader>tgf",
		-- "<Cmd>Telescope live_grep<CR>",
		function()
			require("telescope.builtin").live_grep({ additional_args = extr_args })
		end,
		desc = " Search text in cucurrent directory",
	},
	{
		"<C-f>",
		-- "<Cmd>Telescope find_files<CR>",
		function()
			require("telescope.builtin").find_files({
				find_command = { "rg", "--color=never", "--smart-case", "--files", unpack(extr_args) },
			})
		end,
		desc = ".* Search files cucurrent directory",
	},
	{
		"<leader>ts",
		"<Cmd>Telescope spell_suggest<CR>",
		desc = "益spell suggestions about cursor word",
	},
	{
		"<leader>tb",
		function()
			require("telescope.builtin").buffers()
		end,
		desc = "find buffers",
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
