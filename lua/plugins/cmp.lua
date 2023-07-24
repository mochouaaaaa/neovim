local M = {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    enabled = true,
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'saadparwaiz1/cmp_luasnip',
        'octaltree/cmp-look',
        'tzachar/cmp-tabnine',
    },
}

function M.config()
    local cmp_status_ok, cmp = pcall(require, 'cmp')
    if not cmp_status_ok then
        return
    end

    local luasnip = require('luasnip')

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
        enabled = function()
            if
                require('cmp.config.context').in_treesitter_capture('comment') == true
                or require('cmp.config.context').in_syntax_group('Comment')
            then
                return false
            else
                return true
            end
        end,

        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        experimental = {
            ghost_text = false,
            git = {
                async = true,
            },
        },
        matching = {
            disallow_fuzzy_matching = true,
            disallow_fullfuzzy_matching = true,
            disallow_partial_fuzzy_matching = false,
            disallow_partial_matching = false,
            disallow_prefix_unmatching = true,
        },
        preselect = cmp.PreselectMode.Item,
        sorting = {
            comparators = {
                -- cmp.config.compare.sort_text,
                -- cmp.config.compare.score,
                -- cmp.config.compare.recently_used,
                --
                cmp.config.compare.sort_text,
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.kind,
                cmp.config.compare.length,
                cmp.config.compare.order,
                cmp.config.compare.recently_used,
            },
        },
        completion = {
            completeopt = 'menu,menuone,noinsert', -- remove default noselect
        },
        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(entry, vim_item)
                local lspkind_icons = {
                    Text = '',
                    Method = '',
                    Function = '󰊕',
                    Constructor = '󰡱',
                    Field = '',
                    Variable = '',
                    Class = '',
                    Interface = '',
                    Module = '',
                    Property = '',
                    Unit = '',
                    Value = '',
                    Enum = '',
                    Keyword = '',
                    Snippet = '',
                    Color = '',
                    File = '',
                    Reference = '',
                    Folder = '',
                    EnumMember = '',
                    Constant = '',
                    Struct = '',
                    Event = '',
                    Operator = '',
                    TypeParameter = ' ',
                    Robot = '󱚤',
                    Smiley = ' ',
                    Note = ' ',
                }
                local meta_type = vim_item.kind
                -- load lspkind icons
                vim_item.kind = lspkind_icons[vim_item.kind]
                if entry.source.name == 'cmp_tabnine' then
                    vim_item.kind = lspkind_icons['Robot']
                    -- vim_item.kind_hl_group = "CmpItemKindTabnine"
                end

                if entry.source.name == 'emoji' then
                    vim_item.kind = lspkind_icons['Smiley']
                    vim_item.kind_hl_group = 'CmpItemKindEmoji'
                end

                if entry.source.name == 'look' then
                    vim_item.kind = lspkind_icons['Note']
                    -- vim_item.kind_hl_group = "CmpItemKindEmoji"
                end
                vim_item.menu = ({
                    buffer = '[Buffer]',
                    nvim_lsp = meta_type,
                    path = '[Path]',
                    luasnip = '[LuaSnip]',
                    cmp_tabnine = '[TN]',
                    emoji = '[Emoji]',
                    look = '[Dict]',
                })[entry.source.name]

                return vim_item
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.abort(), -- 取消补全，esc也可以退出
            ['<CR>'] = cmp.mapping.confirm({ select = true }),

            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complate()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" })
        }),
        -- You can set mappings if you want
        -- mapping = insert_map,
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp',                priority = 50 },
            { name = 'cmp_tabnine',             priority = 90 },
            { name = 'luasnip',                 priority = 50 },
            { name = 'path',                    priority = 99 },
            { name = 'buffer',                  priority = 50, max_item_count = 5 },
            { name = 'emoji',                   priority = 50 },
            { name = 'nvim_lsp_signature_help', priority = 50 },
            {
                name = 'look',
                keyword_length = 5,
                max_item_count = 5,
                option = {
                    convert_case = true,
                    loud = true,
                    --dict = '/usr/share/dict/words'
                },
            },
        }),
    })

    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" }
        }
    })
    cmp.setup.filetype({ 'TelescopePrompt' }, {
        sources = {},
    })

    cmp.setup.filetype({ 'vim', 'markdown' }, {
        sources = {
            {
                name = 'look',
                keyword_length = 5,
                max_item_count = 5,
                option = {
                    convert_case = true,
                    loud = true,
                    --dict = '/usr/share/dict/words'
                },
            },
        },
    })
end

return M
