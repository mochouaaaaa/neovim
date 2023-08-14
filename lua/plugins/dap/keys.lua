local M = {}

M.keys = {
	{
		"<f5>",
		function()
			require("telescope").extensions.dap.configurations()
			-- require("dap").continue()
		end,
		desc = "list debug config",
	},
	{
		"<leader>db",
		function()
			require("dap").set_breakpoint()
		end,
		desc = "set debug point",
	},
}

return M
