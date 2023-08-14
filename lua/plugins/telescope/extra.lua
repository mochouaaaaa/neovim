return {
	{
		"jvgrootveld/telescope-zoxide", -- powerful cd
		keys = {
			{ "<leader>cd", "<cmd>Telescope zoxide list<cr>", desc = " Cd recently directory" },
		},
	},
	{
		{
			"mycf/telescope-fly.nvim",
			config = function()
				local telescope = require("telescope")
				telescope.load_extension("fly")
			end,
			keys = {
				{ "<leader>fl", "<cmd>Telescope fly<cr>", mode = "n", desc = "小鹤查形" },
			},
		},
	},
	{
		"AckslD/nvim-neoclip.lua",
		event = "TextYankPost",
		keys = {
			{ "<leader><C-p>", "<Cmd>Telescope neoclip<cr>", desc = "📋Clipboard History" },
			{ "<leader>P", "<Cmd>Telescope neoclip unnamed<cr>", desc = "📋Clipboard History for system" },
		},
		dependencies = "kkharji/sqlite.lua",
		version = false,
		opts = {
			history = 500,
			enable_persistent_history = true,
			enable_macro_history = false,
			keys = {
				telescope = {
					i = {
						select = "<cr>",
						paste = "<c-o>",
						paste_behind = "<c-p>",
						replay = "<c-r>", -- replay a macro
						delete = "<c-d>", -- delete an entry
					},
					n = {
						select = "<cr>",
						paste = "p",
						paste_behind = "P",
						replay = "r",
						delete = "d",
					},
				},
			},
		},

		config = function(_, opts)
			require("neoclip").setup(opts)
			require("telescope").load_extension("neoclip")
		end,
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
		keys = {
			{
				"<leader>mm",
				function()
					require("telescope.builtin").symbols({ sources = { "emoji", "kaomoji", "gitmoji" } })
				end,
				desc = "🤠Search Symbols",
			},
		},
	},
}
