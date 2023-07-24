return {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
        { 'debugloop/telescope-undo.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-telescope/telescope-dap.nvim', },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local trouble = require('trouble.providers.telescope')

        telescope.setup({
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        prompt_position = 'bottom',
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = { mirror = false },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                sorting_strategy = 'ascending',
                prompt_prefix = '> ',
                selection_caret = ' ',
                winblend = 0,
                file_ignore_patterns = {
                    'vendor/*',
                    '%.lock',
                    '__pycache__/*',
                    '%.sqlite3',
                    '%.ipynb',
                    'node_modules/*',
                    '%.jpg',
                    '%.jpeg',
                    '%.png',
                    '%.svg',
                    '%.otf',
                    '%.ttf',
                    '.git/',
                    '%.webp',
                    '.dart_tool/',
                    '.github/',
                    '.gradle/',
                    '.idea/',
                    '.settings/',
                    '.vscode/',
                    '__pycache__/',
                    'build/',
                    'env/',
                    'gradle/',
                    'node_modules/',
                    'target/',
                    '%.pdb',
                    '%.dll',
                    '%.class',
                    '%.exe',
                    '%.cache',
                    '%.ico',
                    '%.pdf',
                    '%.dylib',
                    '%.jar',
                    '%.docx',
                    '%.met',
                    'smalljre_*/*',
                    '.vale/',
                    '%.burp',
                    '%.mp4',
                    '%.mkv',
                    '%.rar',
                    '%.zip',
                    '%.7z',
                    '%.tar',
                    '%.bz2',
                    '%.epub',
                    '%.flac',
                    '%.tar.gz',
                    '%.css',
                    '%.js',
                },
                mappings = {
                    i = {
                        ['<C-n>'] = actions.cycle_history_next,
                        ['<C-p>'] = actions.cycle_history_prev,

                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,

                        ['<C-c>'] = actions.close,
                        --
                        ['<Down>'] = actions.move_selection_next,
                        ['<Up>'] = actions.move_selection_previous,

                        ['<CR>'] = actions.select_default,
                        ['<C-s>'] = actions.select_horizontal,
                        ['<C-v>'] = actions.select_vertical,
                        ['<C-t>'] = actions.select_tab,

                        ['<C-u>'] = actions.preview_scrolling_up,
                        ['<C-d>'] = actions.preview_scrolling_down,

                        ['<PageUp>'] = actions.results_scrolling_up,
                        ['<PageDown>'] = actions.results_scrolling_down,

                        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                        ['<C-l>'] = actions.complete_tag,
                        ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
                        ['<c-t>'] = trouble.open_with_trouble,
                    },

                    n = {
                        ['<esc>'] = actions.close,
                        ['<CR>'] = actions.select_default,
                        ['<C-s>'] = actions.select_horizontal,
                        ['<C-v>'] = actions.select_vertical,
                        ['<C-t>'] = actions.select_tab,

                        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                        ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                        ['j'] = actions.move_selection_next,
                        ['k'] = actions.move_selection_previous,
                        ['H'] = actions.move_to_top,
                        ['M'] = actions.move_to_middle,
                        ['L'] = actions.move_to_bottom,

                        ['<Down>'] = actions.move_selection_next,
                        ['<Up>'] = actions.move_selection_previous,
                        ['gg'] = actions.move_to_top,
                        ['G'] = actions.move_to_bottom,

                        ['<C-u>'] = actions.preview_scrolling_up,
                        ['<C-d>'] = actions.preview_scrolling_down,

                        ['<PageUp>'] = actions.results_scrolling_up,
                        ['<PageDown>'] = actions.results_scrolling_down,

                        ['?'] = actions.which_key,
                        ['<c-t>'] = trouble.open_with_trouble,
                    },
                },
            },
            -- pickers = {
            --     find_files = {
            --         find_command = { 'fd', '--type', '--strip-cwd-prefix' }
            --     }
            -- },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                ['ui-select'] = {
                    require('telescope.themes').get_cursor {
                        borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
                        -- borderchars = {
                        -- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
                        -- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
                        -- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                        -- }
                    }
                },
                undo = {
                    side_by_side = true,
                    layout_strategy = 'vertical',
                    layout_config = {
                        preview_height = 0.5,
                    },
                },
            },
        })

        require('telescope').load_extension('projects')
        telescope.load_extension('fzf')
        require('telescope').load_extension('undo')
        require('telescope').load_extension('ui-select')
        telescope.load_extension('dap')
    end,
    keys = {
        --禁用 grep files 按键映射, 不然不生效
        { "<leader>/", false },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({
                    --cwd = require("lazy.core.config").options.root
                })
            end,
            desc = "列出当前工作目录中的文件"
        }, {
        "<leader>fg",
        function()
            require("telescope.builtin").live_grep({
                --cwd = require("lazy.core.config").options.root
            })
        end,
        desc = "在当前工作目录中搜索字符串，并在键入时实时获取结果"
    }, {
        "<leader><space>",
        function()
            require("telescope.builtin").buffers(
            -- {
            --    cwd = require("lazy.core.config").options.root
            -- }
            )
        end,
        desc = "列出当前 neovim 实例中的打开缓冲区"
    }, {
        "<leader>fh",
        function()
            require("telescope.builtin").help_tags(
            --     {
            --        cwd = require("lazy.core.config").options.root
            --    }
            )
        end,
        desc = "列出可用的帮助标记，并打开一个新窗口，其中包含相关的帮助信息"
    },
        {
            "<leader>?",
            function()
                require("telescope.builtin").oldfiles(
                -- {
                --     cwd = require("lazy.core.config").options.root
                -- }
                )
            end,
            desc = "列出历史打开过的文件"
        },
        {
            '<leader>td',
            function()
                vim.cmd('TodoTelescope')
            end,
            desc = 'Toggle Todo Telescope',
        },
        {
            '<leader>jl',
            function()
                require('telescope.builtin').jumplist()
            end,
            desc = 'Toggle Telescope jumplist',
        },
    }
}
