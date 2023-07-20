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
    {
        "williamboman/nvim-lsp-installer",
        opts = {
            automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
            ui = {
                icons = {
                    server_installed = "✓",
                    server_pending = "➜",
                    server_uninstalled = "✗"
                }
            }
        }
    },
    {
     "tzachar/cmp-tabnine",
        build = './install.sh',
        dependencies = 'hrsh7th/nvim-cmp',
    }
}
