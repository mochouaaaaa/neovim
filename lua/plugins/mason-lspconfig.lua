return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "gopls", "lua_ls", "rust_analyzer"
        }
    },
}
