return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"hrsh7th/cmp-nvim-lsp",
			cond = function()
				return require("lazyvim.util").has("nvim-cmp")
			end,
		},
	},
	config = function()
		local on_attach = function(_, buffnr)
			vim.bo[buffnr].omnifunc = "v:lua.vim.lsp.omnifunc"
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end
			end
			vim.keymap.set("n", keys, func, { buffer = buffnr, desc = desc })
		end

	end,
}
