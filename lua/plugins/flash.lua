-- local M = {
--     'folke/flash.nvim',
-- }
--
-- function M.config()
--     require('flash').setup({
--         modes = {
--             search = {
--                 enabled = false,
--             },
--             char = {
--                 enabled = false,
--                 keys = { 'f', 'F', 't', 'T' },
--             },
--         },
--     })
--     -- to use this, make sure to set `opts.modes.char.enabled = false`
--     local Config = require('flash.config')
--     local Char = require('flash.plugins.char')
--     for _, motion in ipairs({ 'f', 'F' }) do
--         vim.keymap.set({ 'n', 'x', 'o' }, motion, function()
--             require('flash').jump(Config.get({
--                 mode = 'char',
--                 search = {
--                     mode = Char.mode(motion),
--                     max_length = 1,
--                 },
--             }, Char.motions[motion]))
--         end)
--     end
-- end
--
-- return M

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
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
	},
	config = function()
		require("flash").setup()
	end,
}
