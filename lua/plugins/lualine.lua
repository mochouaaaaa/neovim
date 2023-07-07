return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    -- dependencies = { 'kyazdani42/nvim-web-devicons'},
    config = function()
        require('lualine').setup()
    end
}
