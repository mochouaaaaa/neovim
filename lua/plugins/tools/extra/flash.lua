local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
}

local api, fn = vim.api, vim.fn

M.keys = {
	{
		"s",
		mode = { "n", "x", "o" },
		function()
			require("flash").jump({
				search = {
					mode = function(str)
						return "\\<" .. str
					end,
				},
			})
		end,
		desc = "Flash Jump",
	},
	{
		"S",
		mode = { "n", "x", "o" },
		function()
			require("flash").treesitter()
		end,
		desc = "Flash Treesitter Search",
	},
	{
		"R",
		mode = { "o", "x" },
		function()
			require("flash").treesitter_search()
		end,
		desc = "Flash Treesitter Search",
	},
}

M.opts = {}

function M.config(_, opts)
	require("flash").setup(opts)
	local set_hl = api.nvim_set_hl
	set_hl(0, "FlashLabel", {
		bg = "#ff007c",
		fg = "#c8d3f5",
	})
	set_hl(0, "FlashMatch", {
		bg = "#5377da",
		fg = "#b6c5f0",
	})
end

return M

