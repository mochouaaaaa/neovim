return {
	"mfussenegger/nvim-dap-python",
	config = function()
		local env = require("plugins.dap.env")
		require("dap-python").setup(env.pythonPath())
	end,
}
