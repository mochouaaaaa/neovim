return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			-- All the patterns used to detect root dir, when **"pattern"** is in
			detection_methods = { "lsp", "pattern" },
			-- detection_methods
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
			-- Show hidden files in telescope
			show_hidden = true,
			silent_chdir = false,
		})
	end,
}
