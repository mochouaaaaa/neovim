local M = {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons", "kazhala/close-buffers.nvim" },
	opts = function()
		require("close_buffers").setup({
			preserve_window_layout = { "this" },
			next_buffer_cmd = function(windows)
				require("bufferline").cycle(1)
				local bufnr = vim.api.nvim_get_current_buf()

				for _, window in ipairs(windows) do
					vim.api.nvim_win_set_buf(window, bufnr)
				end
			end,
		})

		return {
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				diagnostics_indicator = function(_, _, diagnostics_dict)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return vim.trim(s)
				end,
				show_buffer_close_icons = true,
				show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
				modified_icon = "💌",
				numbers = function(opts)
					return string.format("%s·%s", opts.lower(opts.ordinal), opts.raise(opts.id))
				end,
				hover = { enabled = true, delay = 200, reveal = { "close" } },
				enforce_regular_tabs = true,
				-- separator_style = "triky", -- slant, padded_slant | triky
				-- offsets = {
				-- },
			},
		}
	end,
}

M.keys = {
	{ "<A-w>", ":BDelete this<CR>", desc = "close current buffer" },
	{ "<A-o>", "<Cmd>BufferLineCloseOthers<CR>", desc = "close all other visible buffers" },
	-- 左右切换
	{ "<S-h>", "<Cmd>BufferLineCyclePrev<CR>" },
	{ "<S-l>", "<Cmd>BufferLineCycleNext<CR>" },
	{ "<S-left>", "<Cmd>BufferLineCyclePrev<CR>" },
	{ "<S-right>", "<Cmd>BufferLineCycleNext<CR>" },
}

return M
