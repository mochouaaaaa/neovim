return {
    "jose-elias-alvarez/null-ls.nvim",
    cond = not vim.g.vscode,
    config = function()
        local null_ls = require("null-ls")
        local perfer_local = vim.fn.stdpath("data") .. "/mason/bin"
        local home = os.getenv("HOME")
        null_ls.setup({
            -- log = {
            --   enable = true,
            --   level = "trace",
            --   use_console = "async",
            -- },
            sources = {
                -- null_ls.builtins.code_actions.gitsigns,
                -- null_ls.builtins.completion.spell,
                -- NOTE: cspell needs to installed first by using npm install -g cspell
                null_ls.builtins.diagnostics.cspell.with({
                    prefer_local = perfer_local,
                    diagnostics_postprocess = function(diagnostic)
                        diagnostic.severity = diagnostic.message:find("Unknown word")
                            and vim.diagnostic.severity["INFO"]
                    end,
                }),
                null_ls.builtins.code_actions.cspell.with({
                    config = {
                        find_json = function(params)
                            return home .. "/.cspell.json"
                        end,
                    },
                }),
                -- null_ls.builtins.diagnostics.codespell,
                -- null_ls.builtins.diagnostics.semgrep.with{
                --   prefer_local = perfer_local,
                --   extra_args = { "--config", "auto" },
                -- },
                null_ls.builtins.formatting.nginx_beautifier,
                null_ls.builtins.formatting.prettier.with({
                    prefer_local = perfer_local,
                    condition = function(utils)
                        return utils.has_file({ ".prettierrc.js" })
                    end,
                }),
                null_ls.builtins.formatting.sqlformat,
                null_ls.builtins.formatting.stylelint,
                -- null_ls.builtins.formatting.codespell,
                null_ls.builtins.hover.dictionary,
            },
        })
    end,
}
