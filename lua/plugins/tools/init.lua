return {
	{
		import = "plugins.tools.extra",
	},
	{
		"lukas-reineke/headlines.nvim",
		ft = { "markdown", "md", "norg" },
		config = function()
			require("headlines").setup()
			local set_hl = vim.api.nvim_set_hl
			set_hl(0, "CodeBlock", { bg = "NONE" })
			-- for i, color in ipairs {
			--     { fg = '#a6d189', bg = 'NONE' },
			--     { fg = '#8caaee', bg = 'NONE' },
			--     { fg = '#e78284', bg = 'NONE' },
			--     { fg = '#ca9ee6', bg = 'NONE' },
			--     { fg = '#e5c890', bg = 'NONE' },
			--     { fg = '#babbf1', bg = 'NONE' },
			-- } do set_hl(0, 'Headline' .. i, color) end
			-- set_hl(0, 'Headline', { link = 'Headline1' })
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			-- gcc和gc注释修改为C-/
			require("Comment").setup({
				toggler = {
					line = "<M-/>",
				},
				opleader = {
					line = "<M-/>",
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
			vim.keymap.set(
				"n",
				"<leader>td",
				"<Cmd>TodoTelescope<CR>",
				{ desc = "Search through all project todos with Telescope" }
			)
		end,
	},
	{
		"LudoPinelli/comment-box.nvim",
		keys = {
			{
				mode = { "n", "x" },
				"<leader>cbj",
				"<Cmd>lua require('comment-box').llbox()<CR>",
				desc = "Comment Left Box",
			},
			{
				mode = { "n", "x" },
				"<leader>cbk",
				"<Cmd>lua require('comment-box').lcbox()<CR>",
				desc = "Comment Center Box",
			},
			{
				mode = { "n", "x" },
				"<leader>cbl",
				"<Cmd>lua require('comment-box').lrbox()<CR>",
				desc = "Comment Right Box",
			},
			{
				"<leader>cbu",
				"<Cmd>lua require('comment-box').line()<CR>",
				desc = "Comment Left Line",
			},
			{
				"<leader>cbi",
				"<Cmd>lua require('comment-box').cline()<CR>",
				desc = "Comment Center Line",
			},
			{
				"<leader>cbo",
				"<Cmd>lua require('comment-box').rline()<CR>",
				desc = "Comment Right Line",
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
		keys = {
			{
				"<leader>gg",
				"<cmd>:LazyGit<CR>",
				desc = "git manager",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local socket = require("socket")

			local gitsigns = require("gitsigns")
			local gs = package.loaded.gitsigns
			gitsigns.setup({
				on_attach = function(bufnr)
					local wk = require("which-key")
					local keys = {
						["<leader>g"] = {
							name = "Git Manager",
							p = {
								function()
									-- first call, second entry
									gitsigns.preview_hunk()
									socket.select(nil, nil, 0.2)
									gitsigns.preview_hunk()
								end,
								"Preview hunk",
							},
							r = { gitsigns.reset_hunk, "Revert hunk" },
							U = {

								gitsigns.undo_stage_hunk,
								"Undo stage file",
							},
							["["] = { gitsigns.prev_hunk, "Previous hunk" },
							["]"] = { gitsigns.next_hunk, "Next hunk" },
						},
					}
					local visual = {
						["<leader>g"] = {
							a = {
								function()
									gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
								end,
								"Stage hunk",
							},
							r = {
								function()
									gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
								end,
								"undo reset hunk",
							},
						},
					}
					wk.register(keys, { bufnr = bufnr })
					wk.register(visual, { mode = "v" })
				end,

				signs = {
					add = {
						hl = "GitSignsAdd",
						text = "+",
						numhl = "GitSignsAddNr",
						linehl = "GitSignsAddLn",
					},
					change = {
						hl = "GitSignsChange",
						text = "~",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "_",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "‾",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "~",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = { interval = 1000, follow_files = true },
				attach_to_untracked = true,
				current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 0,
					ignore_whitespace = false,
				},
				current_line_blame_formatter_opts = { relative_time = true },
				current_line_blame_formatter = "      <author>, <author_time:%R> - <summary>",
				-- current_line_blame_formatter = function(name, blame_info,opts)
				--        if blame_info.author == name then blame_info.author = 'You' end
				--        local text
				--        if blame_info.author == 'Not Committed Yet' then
				--            text = blame_info.author
				--        else
				--            local date_time
				--            if opts.relative_time then
				--              date_time = require('gitsigns.util').get_relative_time(tonumber(blame_info['author_time']))
				--            else
				--              date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
				--            end
				--            text = string.format('%s%s, %s - %s', blame_info.author,blame_info.author_mail,date_time,
				--                                -- os.date(
				--                                --      '%Y-%m-%d',
				--                                --      tonumber(blame_info['author_time'])),
				--                                 blame_info.summary)
				--        end
				--        return {{'       ' .. text, 'GitSignsCurrentLineBlame'}}
				--    end,
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000,
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = { enable = false },
			})
		end,
	},
	{
		"theniceboy/joshuto.nvim",
		config = function() end,
	},
}
