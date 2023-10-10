local M = {
	{ import = "plugins.ui" },
	{ import = "plugins.ui.extra" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VimEnter",
		priority = 1000,
		opts = function()
			return {
				flavour = "mocha",
				transparent_background = not vim.g.neovide,
				custom_highlights = require("plugins.ui.theme.override"),
				-- dim_inactive = {
				--     enabled = true,
				--     shade = 'dark',
				--     percentage = 0.15,
				-- },
				integrations = {
					cmp = true,
					notify = false,
					neotree = true,
					gitsigns = true,
					markdown = true,
					telescope = true,
					headlines = true,
					telekasten = true,
					ts_rainbow2 = true,
					lsp_trouble = true,
					native_lsp = { enabled = true },

					treesitter = true,
					treesitter_context = true,
					dropbar = { enabled = true, color_mode = true },

					-- navic              = { enabled = true },
					-- leap               = true,
					-- mason = true,
					-- indent_blankline = {
					--     enable = true,
					--     colored_indent_levels = true,
					-- },
				},
			}
		end,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- { import = "plugins.ui.theme.onedark" },
}

return M
