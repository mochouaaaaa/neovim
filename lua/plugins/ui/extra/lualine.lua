local function memory_use()
	local use = (1 - (vim.uv.get_free_memory() / vim.uv.get_total_memory())) * 100
	return (" Memory: %.2f"):format(use) .. " %%"
end

local function opts()
	local winbar = {
		lualine_a = {
			{
				function()
					-- return " " .. os.date("%A %H:%M")
					return "吾日三省"
				end,
				separator = { left = "", right = "" },
				right_padding = 2,
			},
		},
		lualine_b = {
			{
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = "#ff9e64" },
			},
		},
		lualine_c = { "%{%v:lua.dropbar.get_dropbar_str()%}" },
		lualine_y = {
			{
				memory_use,
				color = {
					fg = "#69bbae",
					bg = "#304263",
				},
			},
		},
		lualine_z = {
			{
				"fancy_lsp_servers",
				color = {
					fg = "#1e1e2e",
					bg = "#986FEC",
				},
				separator = { right = "" },
				left_padding = 2,
			},
		},
	}

	local sections = {
		lualine_a = {
			-- { "fancy_mode", width = 6 },
			{ "fancy_mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = {
			{
				-- "b:gitsigns_head",
				"fancy_branch",
				icon = "",
				color = {
					fg = "#69bbae",
					bg = "#1e1e2e",
				},
			},
			{ "fancy_diff" },
			{ "fancy_diagnostics", separator = { right = "" }, right_padding = 2 },
		},

		lualine_c = {
			{ "fancy_cwd", substitute_home = true },
		},
		lualine_x = {
			{ "fancy_macro", cmdheight = 0 },
			{ "fancy_filetype", ts_icon = "" },
		},
		lualine_z = {
			{ "fancy_searchcount" },
			{ "fancy_location", separator = { right = "" }, left_padding = 2 },

			-- {
			-- function()
			-- local loc = require("lualine.components.location")()
			-- local sel = require("lualine.components.selectioncount")()
			-- if sel ~= "" then
			-- 	loc = loc .. " (" .. sel .. " sel)"
			-- end
			-- return loc
			-- end,
			-- 	separator = { right = "" },
			-- 	left_padding = 2,
			-- },
		},
	}

	return {
		options = {
			component_separators = "|",
			-- component_separators = { left = "", right = "" },
			-- theme = "auto",
			-- theme = "onedark",
			theme = "catppuccin",
			section_separators = {
				right = "",
				left = "",
			},
			globalstatus = true,
			refresh = {
				statusline = 100,
			},
			ignore_focus = {
				"dapui_watches",
				"dapui_stacks",
				"dapui_breakpoints",
				"dapui_scopes",
				"dapui_console",
				"dap-repl",
			},
			disabled_filetypes = {
				statusline = {
					"alpha",
					"toggleterm",
					"lspsagaoutline",
				},
				winbar = {
					"alpha",
					"help",
					"lspsagaoutline",
					"Trouble",
					"toggleterm",
					"dap-repl",
					"dapui_console",
					"dapui_watches",
					"dapui_stacks",
					"dapui_breakpoints",
					"dapui_scopes",
				},
			},
		},
		sections = sections,
		winbar = winbar,
		extensions = { "trouble", "lazy", "neo-tree" },
	}
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"meuter/lualine-so-fancy.nvim",
		{
			"Bekaboo/dropbar.nvim",
			keys = {
				{
					"<leader>k",
					function()
						require("dropbar.api").pick()
					end,
					desc = "dropbar.api.pick",
				},
			},
			opts = {
				general = { enable = false },
				menu = {
					win_configs = {
						border = "rounded",
					},
				},
			},
		},
	},
	opts = opts,
}
