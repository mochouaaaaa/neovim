-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    -- {
    --     "williamboman/nvim-lsp-installer",
    --     opts = {
    --         automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    --         ui = {
    --             icons = {
    --                 server_installed = "✓",
    --                 server_pending = "➜",
    --                 server_uninstalled = "✗",
    --             },
    --         },
    --     },
    -- },
    {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        dependencies = "hrsh7th/nvim-cmp",
    },
    {
        "christoomey/vim-tmux-navigator",
    },
    {
        'uga-rosa/translate.nvim',
        config = function()
            local default_command = 'google'
            -- if vim.fn.executable('trans') then
            --   default_command = 'translate_shell'
            -- end
            require('translate').setup({
                default = {
                    command = default_command
                },
                preset = {
                    output = {
                        floating = {
                            border = 'none'
                        }
                    }
                }
            })
        end,
    },
    {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup()
            --   local wk = require('which-key')
            --   wk.register({
            --     f = {
            --       name = 'Telescope Finder',
            --       i = { name = 'BuildIn | Reloader' },
            --       m = { name = 'Mark' },
            --       h = { name = 'History | Help | Highlight' },
            --       w = { name = 'Workspace | LSP Action' },
            --       s = { name = 'Spectre' },
            --     },
            --     c = { name = 'Code' },
            --     d = { name = 'DAP' },
            --     o = { name = 'Orgmode' },
            --     m = { name = 'Markdown | Format | Marks' },
            --     r = { name = 'Rename | Rest' },
            --     s = { name = 'Source | Session' },
            --     t = { name = 'Translate' },
            --     w = { name = 'Workspace' },
            --     g = { name = 'Git' }
            --   }, { prefix = '<leader>' })
        end
    },
    -- markdown preview
    {
        'iamcco/markdown-preview.nvim',
        build = function() vim.fn['mkdp#util#install']() end,
        ft = 'markdown',
        config = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end
    },

}
