-- 自动打开括号
return {
    "windwp/nvim-autopairs",

    opts = function(_, opts)
        local npairs_ok, npairs = pcall(require, "nvim-autopairs")
        if not npairs_ok then return end

        -- 配置这个使得自动补全会把括号带上
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

        opts.check_ts = true
        opts.ts_config = {
            lua = {"string", "source"},
            javascript = {"string", "template_string"}
        }
        opts.fast_wrap = {
            map = '<M-e>',
            chars = {'{', '[', '(', '"', "'"},
            pattern = [=[[%'%"%)%>%]%)%}%,]]=],
            end_key = '$',
            keys = 'qwertyuiopzxcvbnmasdfghjkl',
            check_comma = true,
            highlight = 'Search',
            highlight_grey = 'Comment'
        }
    end
}
