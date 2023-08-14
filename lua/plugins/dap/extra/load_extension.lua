local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "debugloop/telescope-undo.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-dap.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "kdheepak/lazygit.nvim" },
	},
}

function M.config()
	local telescope = require("telescope")
	telescope.load_extension("fzf")
	telescope.load_extension("undo")
	telescope.load_extension("ui-select")
	telescope.load_extension("dap")
	telescope.load_extension("file_browser")
	telescope.load_extension("lazygit")
end

return M
