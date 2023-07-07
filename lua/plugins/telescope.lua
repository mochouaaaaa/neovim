return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or branch = '0.1.1',
    dependencies = {'nvim-lua/plenary.nvim'},
    opts = function (_, opts)
        opts.defaults = {
            layout_strategy = "horizontal",
            --layout_config = {
            --    prompt_position = "top"
            --},
            sorting_strategy = "ascending",
            winblend = 0
        }
    end,
    --keys = {
    --    --禁用 grep files 按键映射, 不然不生效
    --    {"<leader>/", false},
    --    {
    --        "<leader>ff",
    --        function()
    --            require("telescope.builtin").find_files({
    --                cwd = require("lazy.core.config").options.root
    --            })
    --        end,
    --        desc = "列出当前工作目录中的文件"
    --    }, {
    --        "<leader>fg",
    --        function()
    --            require("telescope.builtin").live_grep({
    --                cwd = require("lazy.core.config").options.root
    --            })
    --        end,
    --        desc = "在当前工作目录中搜索字符串，并在键入时实时获取结果"
    --    }, {
    --        "<leader>fb",
    --        function()
    --            require("telescope.builtin").buffers({
    --                cwd = require("lazy.core.config").options.root
    --            })
    --        end,
    --        desc = "列出当前 neovim 实例中的打开缓冲区"
    --    }, {
    --        "<leader>fh",
    --        function()
    --            require("telescope.builtin").help_tags({
    --                cwd = require("lazy.core.config").options.root
    --            })
    --        end,
    --        desc = "列出可用的帮助标记，并打开一个新窗口，其中包含相关的帮助信息"
    --    }
    --}
}
