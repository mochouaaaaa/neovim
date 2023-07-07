return {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    opts = {
        -- make sure mason installs the server
        servers = {
            -- -@type lspconfig.options.tsserver
            tsserver = {
                settings = {
                    gopls = {
                        cmd = { "gopls" },
                        filetypes = { "go", "gomod", "gowork", "gotmpl" },
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = { unusedparams = true }
                    }
                },
            },
        },
        setup = {
            tsserver = function(_, opts)
                require("lazyvim.util").on_attach(function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end
                        })
                    end
                end)
                --require("typescript").setup({ server = opts })
                return true
            end,
        },
    },
}