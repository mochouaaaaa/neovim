local M = {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	-- version = "*"
}

function M.config()
	require("neogen").setup({
		enabled = true,
		input_after_comment = true,
	})
end

return M
