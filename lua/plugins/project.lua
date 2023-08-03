local M = {
	"ahmedkhalf/project.nvim",
	cmd = { "BufWritePost", "BufReadPost", "InsertLeave" },
}

function M.config()
	require("project_nvim").setup({
		-- All the patterns used to detect root dir, when **"pattern"** is in
		detection_methods = { "lsp", "pattern" },
		-- detection_methods
		patterns = {
			".git",
			".python-version",
			"requirements.txt",
			"go.mod",
			".go-version",
			".svn",
			"Makefile",
			"package.json",
		},
		-- Show hidden files in telescope
		show_hidden = true,
		silent_chdir = false,
	})
end

return M
