--return {
--    "neovim/nvim-lspconfig",
--    event = { "BufReadPre", "BufNewFile" },
--    dependencies = {
--        { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
--        { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
--        "mason.nvim",
--        "williamboman/mason-lspconfig.nvim",
--        {
--            "hrsh7th/cmp-nvim-lsp",
--            cond = function()
--                return require("lazyvim.util").has("nvim-cmp")
--            end,
--        },
--    },
--    opts = {
--        autoformat = true,
--        servers = {
--            jsonls = {},
--            lua_ls = {
--                capabilities = require('cmp_nvim_lsp').default_capabilities(),
--                settings = {
--                    Lua = {
--                        runtime = "LuaJIT"
--                    },
--                    diagnostics = { globals = { "vim", "packer_bootstrap" } },
--                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
--                    telemetry = { enable = false }
--                }
--            }
--        }
--    },
--    config = function(_, opts)
--        local lspconfig = require("lspconfig")
--        local util = require "lspconfig/util"
--
--        -- golang
--        lspconfig.gopls.setup {
--            capabilities = capabilities,
--            cmd = { "gopls" },
--            filetypes = { "go", "gomod", "gowork", "gotmpl" },
--            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--            settings = {
--                gopls = {
--                    completeUnimported = true,
--                    usePlaceholders = true,
--                    analyses = { unusedparams = true }
--                }
--            }
--        }
--    end,
--}


return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
        { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "hrsh7th/cmp-nvim-lsp",
            cond = function()
                return require("lazyvim.util").has("nvim-cmp")
            end,
        },
    },
    ---@class PluginLspOpts
    --opts = {
    --    -- options for vim.diagnostic.config()
    --    diagnostics = {
    --        underline = true,
    --        update_in_insert = false,
    --        virtual_text = { spacing = 4, prefix = "●" },
    --        severity_sort = true,
    --    },
    --    -- Automatically format on save
    --    autoformat = true,
    --    -- options for vim.lsp.buf.format
    --    -- `bufnr` and `filter` is handled by the LazyVim formatter,
    --    -- but can be also overridden when specified
    --    format = {
    --        formatting_options = nil,
    --        timeout_ms = nil,
    --    },
    --    -- LSP Server Settings
    --    -- -@type lspconfig.options
    --    servers = {
    --        lua_ls = {
    --            -- mason = false, -- set to false if you don't want this server to be installed with mason
    --            settings = {
    --                Lua = {
    --                    workspace = {
    --                        checkThirdParty = false,
    --                    },
    --                    completion = {
    --                        callSnippet = "Replace",
    --                    },
    --                },
    --            },
    --        },
    --        gopls = {
    --            cmd = {"gopls"},
    --            filetypes = {"go", "gomod", "gowork", "gotmpl"},
    --            settings = {
    --                gopls = {
    --                    completeUnimported = true,
    --                    usePlaceholders = true,
    --                    analyses = { unusedparams = true }
    --                }
    --            }
    --        }
    --    },
    --    -- you can do any additional lsp server setup here
    --    -- return true if you don't want this server to be setup with lspconfig
    --    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    --    setup = {
    --        -- example to setup with typescript.nvim
    --        -- tsserver = function(_, opts)
    --        --   require("typescript").setup({ server = opts })
    --        --   return true
    --        -- end,
    --        -- Specify * to use this function as a fallback for any server
    --        -- ["*"] = function(server, opts) end,
    --    },
    --},

}