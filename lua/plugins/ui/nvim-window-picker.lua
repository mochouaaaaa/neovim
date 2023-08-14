local M = {
	"s1n7ax/nvim-window-picker",
}

M.keys = {
	{
		"<C-w>w",
		function()
			local picked_window_id = require("window-picker").pick_window()
			if not picked_window_id then
				return
			end
			vim.api.nvim_set_current_win(picked_window_id)
		end,
		desc = "Window Picker",
	},
}

M.opts = {
	selection_chars = "IJKLQWER",
	highlights = {
		statusline = {
			focused = {
				fg = "#74c7ec",
				bg = "#7c3aed",
				bold = true,
			},
			unfocused = {
				fg = "#74c7ec",
				bg = "#181831",
				bold = true,
			},
		},
	},
}

function M.config()
	require("window-picker").setup(M.opts)
end

return M
