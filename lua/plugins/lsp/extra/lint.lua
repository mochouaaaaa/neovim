local M = {
	"mfussenegger/nvim-lint",
	cmd = { "BufWritePost" },
}

function M.config()
	local lint = require("lint")
	lint.linters_by_ft = { markdown = { "cspell" } }
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		desc = "nvim-lint",
		callback = function()
			local linters = lint.linters_by_ft[vim.bo.filetype]
			if not linters then
				linters = {}
				lint.linters_by_ft[vim.bo.filetype] = linters
			end
			if (not vim.bo.buftype or vim.bo.buftype == "") and not vim.tbl_contains(linters, "cspell") then
				table.insert(linters, "cspell")
			end
			lint.try_lint()
		end,
	})
end

return M

