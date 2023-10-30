local M = {
	"nvimdev/guard.nvim",
	-- Builtin configuration, optional
	dependencies = {
		"nvimdev/guard-collection",
	},
}

function M.config()
	local ft = require("guard.filetype")

	-- use clang-format and clang-tidy for c files
	ft("c"):fmt("clang-format"):lint("clang-tidy")

	-- use stylua to format lua files and no linter
	ft("lua"):fmt("stylua")

	-- use lsp to format first then use golines to format
	--ft("go"):fmt("lsp"):append("golines"):lint("golangci")
	ft("go"):fmt("lsp"):append("golines")

	ft("python"):fmt("black"):append("isort"):lint("pylint")
	-- multiple files register
	ft("typescript,javascript,typescriptreact"):fmt("prettier")

	-- call setup LAST
	require("guard").setup({
		-- the only option for the setup function
		fmt_on_save = true,
		-- Use lsp if no formatter was defined for this filetype
		lsp_as_default_formatter = true,
	})
end

return M
