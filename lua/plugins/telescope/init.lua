local M = {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fuzzy finder
			{
				"nvim-lua/plenary.nvim",
				keys = { { ";t", "<Plug>PlenaryTestFile", desc = "Test Plugin" } },
			},
		},
		import = "plugins.telescope.extra",
		config = config,
		keys = require("plugins.telescope.keys"),
	},
	{
		"prochri/telescope-all-recent.nvim",
		lazy = true,
		opts = {},
	},
	{
		import = "plugins.telescope.load_extension"
	}
}

local config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local trouble = require("trouble.providers.telescope")
	require("telescope").setup({
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			multi_icon = " ",
			path_display = {
				"smart",
			},
			-- layout_strategy = "horizontal",
			-- layout_config = { prompt_position = "top" },
			-- sorting_strategy = "ascending",
			-- winblend = 0,
			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,

					["<C-c>"] = actions.close,
					--
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,

					["<CR>"] = actions.select_default,
					["<C-s>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,

					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,

					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,

					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["<C-l>"] = actions.complete_tag,
					["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
					["<c-t>"] = trouble.open_with_trouble,
				},

				n = {
					["<esc>"] = actions.close,
					["<CR>"] = actions.select_default,
					["<C-s>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,

					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["H"] = actions.move_to_top,
					["M"] = actions.move_to_middle,
					["L"] = actions.move_to_bottom,

					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["gg"] = actions.move_to_top,
					["G"] = actions.move_to_bottom,

					["<C-u>"] = actions.preview_scrolling_up,
					["<C-d>"] = actions.preview_scrolling_down,

					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,

					["?"] = actions.which_key,
					["<c-t>"] = trouble.open_with_trouble,
				},
			},
			buffer_previewer_maker = function(filepath, bufnr, opts)
				require("plenary.job")
					:new({
						command = "file",
						args = { "-b", "--mime", filepath },
						on_exit = function(j)
							if j:result()[1]:find("charset=binary", 1, true) then
								vim.schedule(function()
									vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
								end)
							else
								require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
							end
						end,
					})
					:sync()
			end,
		},
		pickers = {
			find_files = { previewer = false },
			live_grep = { theme = "ivy" },

			lsp_references = { theme = "ivy" },
			lsp_definitions = { theme = "ivy" },
			lsp_type_definitions = { theme = "ivy" },
			lsp_implementations = { theme = "ivy" },
			lsp_dynamic_workspace_symbols = {
				sorter = telescope.extensions.fzf.native_fzf_sorter(nil),
			},
		},
		extensions = {
			-- ["ui-select"] = { require("telescope.themes").get_dropdown() },
			["ui-select"] = {
				require("telescope.themes").get_cursor({
					-- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
					borderchars = {
						prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
						results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
						preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					},
				}),
			},
			project = {
				theme = "dropdown",
				hidden_files = false,
			},
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	})
	telescope.load_extension("fzf")
	telescope.load_extension("projects")
	require("telescope-all-recent")
end

return M
