return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "c", "lua", "vim", "vimdoc", "query", "bash", "c", "cpp",
            "javascript", "json", "python"
        },
        highlight = {enable = true},
        indent = {enable = true},

        -- 不同括号颜色区分
        rainbow = {enable = true, extended_mode = true, max_file_lines = nil}
    }

}
