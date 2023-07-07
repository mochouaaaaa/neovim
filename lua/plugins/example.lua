-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then
    return {}
end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
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
    { "p00f/nvim-ts-rainbow" },
    {
        "tmux-navigator",
        config = function()
            require('tmux-navigator').setup { enable = true }
        end
    },
    { "saadparwaiz1/cmp_luasnip" },
    {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
            return require("lazyvim.util").has("nvim-cmp")
        end,
    },
    { "rafamadriz/friendly-snippets" },
    {
        "hrsh7th/cmp-path" -- 文件路径
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
    }
}
