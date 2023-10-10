return {
	{ "navarasu/onedark.nvim" },
	{ "LazyVim/LazyVim", opts = { colorscheme = "onedark" } },
	config = function()
		-- Lua
		require("onedark").setup({
			style = "dark",
			-- Lualine options --
			lualine = {
				transparent = not vim.g.neovide, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {}, -- Override default colors
			highlights = require("plugins.ui.theme.override"), -- Override highlight groups
		})
		require("onedark").load()
	end,
}
