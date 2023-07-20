local M = {
    'williamboman/mason.nvim',
    event = 'VeryLazy',
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	}
}

M.tools = {
    'prettierd',
    'stylua',
    'luacheck',
    'shellcheck',
    'shfmt',
	'lua-language-server',
}

function M.check()
    local mr = require('mason-registry')
    for _, tool in ipairs(M.tools) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
            p:install()
        end
    end
end

function M.config()
    require('mason').setup()
    M.check()
    require('mason-lspconfig').setup({
        automatic_installation = true,
    })
end

return M

-- return {
-- 	"williamboman/mason.nvim",
-- 	cmd = "Mason",
-- 	opts = {
-- 		ui = {
-- 			icons = {
-- 				package_installed = "✓",
-- 				package_pending = "➜",
-- 				package_uninstalled = "✗",
-- 			},
-- 		},
-- 		ensure_installed = {
-- 			"stylua",
-- 			"shfmt",
-- 		},
-- 	},
-- 	config = function(_, opts)
--         table.insert(opts.ensure_installed, "prettierd")

-- 		require("mason").setup(opts)
-- 		local mr = require("mason-registry")
-- 		local function ensure_installed()
-- 			for _, tool in ipairs(opts.ensure_installed) do
-- 				local p = mr.get_package(tool)
-- 				if not p:is_installed() then
-- 					p:install()
-- 				end
-- 			end
-- 		end
-- 		if mr.refresh then
-- 			mr.refresh(ensure_installed)
-- 		else
-- 			ensure_installed()
-- 		end
-- 	end,
-- }
