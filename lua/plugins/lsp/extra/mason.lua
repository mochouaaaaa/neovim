local M = {
	"williamboman/mason.nvim",
	cmd = "Mason",
}

function M.config()
	require("mason").setup({
		ui = {
			border = "rounded",

			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
			keymaps = {
				-- Keymap to expand a package
				toggle_package_expand = "o",
				-- Keymap to install the package under the current cursor position
				install_package = "y",
				-- Keymap to reinstall/update the package under the current cursor position
				update_package = "u",
				-- Keymap to check for new version for the package under the current cursor position
				check_package_version = "c",
				-- Keymap to update all installed packages
				update_all_packages = "U",
				-- Keymap to check which installed packages are outdated
				check_outdated_packages = "C",
				-- Keymap to uninstall a package
				uninstall_package = "d",
				-- Keymap to cancel a package installation
				cancel_installation = "<C-c>",
				-- Keymap to apply language filter
				apply_language_filter = "<C-f>",
			},
		},
	})
end

return M
