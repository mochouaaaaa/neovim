local M = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf",                                config = true },
        { "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
        { "mason.nvim" },
        "williamboman/mason-lspconfig.nvim",
        {
            "hrsh7th/cmp-nvim-lsp",
            cond = function()
                return require("lazyvim.util").has("nvim-cmp")
            end,
        },
        { "nvim-lua/lsp-status.nvim" },
    },
}

function M.confog()
    local lsp_status = require("lsp-status")
    lsp_status.register_progress()
    lsp_status.config({
        diagnostics = false,
        status_symbol = "",
    })

    local common = require("lang.common")


    require("neoconf").setup()
    require("neodev").setup()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
        function(server_name)
            -- if vim.o.diff == "git" then
            --     return
            -- end

            local lsp_config_path = "lang." .. server_name
            local capabilities = common.make_capabilities()
            local config = {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    common.setup(client, bufnr)
                    if pcall(require, lsp_config_path) and require(lsp_config_path).attach ~= nil then
                        require(lsp_config_path).attach(client, bufnr)
                    end
                end,
            }
            local settings = lsp_config_path .. ".settings"
            if pcall(require, settings) then
                config.settings = require(settings)
            end
            require("lspconfig")[server_name].setup(config)
        end,

        -- -- Next, you can provide targeted overrides for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function()
            require("rust-tools").setup {}
        end
    })
end

return M
