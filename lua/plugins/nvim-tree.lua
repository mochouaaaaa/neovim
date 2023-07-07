return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    config = function(_, opts)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- 设置termguidcolors以启用高亮显示组
        vim.opt.termguicolors = true

        require("nvim-tree").setup {}
    end,
}