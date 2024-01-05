return {
	"catppuccin/nvim",
	name = "catppuccin",
	-- event = "VimEnter",
	priority = 1000,
	config = function(_, opts)
		require("catppuccin").setup({
			-- compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
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
				dashboard = true,
				flash = true,
				notify = false,
				neotree = true,
				gitsigns = true,
				markdown = true,
				telescope = true,
				headlines = true,
				telekasten = true,
				ts_rainbow2 = true,
				lsp_trouble = true,
				lsp_saga = false,
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
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
