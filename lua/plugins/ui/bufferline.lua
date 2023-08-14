local M = {
	"akinsho/bufferline.nvim",
}

M.keys = {}

function M.opts()
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
end

return M
