local M = {
	'nvim-lualine/lualine.nvim',
    event = 'VeryLazy'
}

local function clock()
    return ' ' .. os.date('%H:%M')
end


function M.config()
    if vim.g.started_by_firenvim then
        return
    end

    local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn' },
        symbols = { error = ' ', warn = ' ' },
        -- symbols = { error = "  ", warn = "  " },
        colored = false,
        update_in_insert = false,
        always_visible = true,
    }

    local winbar_cfg = {}
    local inactive_winbar_cfg = {}

    local diff = {
        'diff',
        colored = false,
        symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
        cond = hide_in_width,
    }
    -- cool function for progress
    local progress = function()
        local current_line = vim.fn.line('.')
        local total_lines = vim.fn.line('$')
        local chars =
            { '__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)

        if current_line == 1 then
            return 'Top' .. ' ' .. chars[index]
        elseif current_line == total_lines then
            return 'Bot' .. ' ' .. chars[index]
        else
            return math.floor(current_line / total_lines * 100) .. '%%' .. ' ' .. chars[index]
        end
    end

    local conditions = {
        buffer_not_empty = function()
            return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        check_git_workspace = function()
            local filepath = vim.fn.expand('%:p:h')
            local gitdir = vim.fn.finddir('.git', filepath .. ';')
            return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
    }

    require('lualine').setup({
        options = {
            icons_enabled = true,
            -- theme = "gruvbox-material",
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            -- "dapui_watches", "dapui_stacks", "dapui_scopes", "dapui_breakpoints"
            disabled_filetypes = {
                'alpha',
                'dashboard',
                'NvimTree',
                'neo-tree',
                'sagaoutline',
                'tagbar',
            },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', diff, diagnostics },
            lualine_c = {
                {
                    'filename',
                    file_status = true, -- displays file status (readonly status, modified status)
                    path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    shorting_target = 30, -- Shortens path to leave 40 space in the window
                    -- for other components. Terrible name any suggestions?
                },
                -- { require('auto-session-library').current_session_name },
            },
            lualine_x = {
                'encoding',
                -- "fileformat",
                {
                    'filetype',
                    colored = true, -- displays filetype icon in color if set to `true
                    icon_only = false, -- Display only icon for filetype
                },
                {
                    'filesize',
                    icon = '',
                    cond = conditions.buffer_not_empty,
                    color = { fg = '#a3be8c' },
                },
            },
            lualine_y = {
                -- "progress",
                progress,
            },
            lualine_z = { 'location' },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    'filename',
                    file_status = true, -- displays file status (readonly status, modified status)
                    path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    shorting_target = 30, -- Shortens path to leave 40 space in the window
                    -- for other components. Terrible name any suggestions?
                },
                -- { require('auto-session-library').current_session_name },
            },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = winbar_cfg,
        inactive_winbar = inactive_winbar_cfg,
        extensions = {},
    })
end

return M

-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	event = "VeryLazy",
-- 	opts = function()
-- 		local icons = require("lazyvim.config").icons
-- 		local Util = require("lazyvim.util")

-- 		return {
-- 			options = {
-- 				theme = "auto",
-- 				globalstatus = true,
-- 				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
-- 			},
-- 			sections = {
-- 				lualine_a = { "mode" },
-- 				lualine_b = { "branch" },
-- 				lualine_c = {
-- 					{
-- 						"diagnostics",
-- 						symbols = {
-- 							error = icons.diagnostics.Error,
-- 							warn = icons.diagnostics.Warn,
-- 							info = icons.diagnostics.Info,
-- 							hint = icons.diagnostics.Hint,
-- 						},
-- 					},
-- 					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
-- 					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
--           -- stylua: ignore
--           {
--             function() return require("nvim-navic").get_location() end,
--             cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
--           },
-- 				},
-- 				lualine_x = {
--           -- stylua: ignore
--           {
--             function() return require("noice").api.status.command.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
--             color = Util.fg("Statement"),
--           },
--           -- stylua: ignore
--           {
--             function() return require("noice").api.status.mode.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
--             color = Util.fg("Constant"),
--           },
--           -- stylua: ignore
--           {
--             function() return "  " .. require("dap").status() end,
--             cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
--             color = Util.fg("Debug"),
--           },
-- 					{
-- 						require("lazy.status").updates,
-- 						cond = require("lazy.status").has_updates,
-- 						color = Util.fg("Special"),
-- 					},
-- 					{
-- 						"diff",
-- 						symbols = {
-- 							added = icons.git.added,
-- 							modified = icons.git.modified,
-- 							removed = icons.git.removed,
-- 						},
-- 					},
-- 				},
-- 				lualine_y = {
-- 					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
-- 					{ "location", padding = { left = 0, right = 1 } },
-- 				},
-- 				lualine_z = {
-- 					function()
-- 						return " " .. os.date("%R")
-- 					end,
-- 				},
-- 			},
-- 			extensions = { "neo-tree", "lazy" },
-- 		}
-- 	end,
-- }
