return {
	"liuchengxu/vista.vim",
    config = function (_, opts)

        vim.g.vista_executive_for = {
            vimwiki = 'markdown',
            pandoc = 'markdown',
            markdown = 'toc',
            go = 'coc'
        }
    end
}
