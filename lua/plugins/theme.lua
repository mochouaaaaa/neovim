return {
	{ "navarasu/onedark.nvim" },
	{ "LazyVim/LazyVim", opts = { colorscheme = "onedark" } },
	config = function()
		-- Lua
		require("onedark").setup({
			style = "dark",
		})
	end,
}
