local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
}

M.keys = require("plugins.dap.keys").keys

function M.config()
	local fn = vim.fn
	local dap_breakpoint_color = {
		breakpoint = {
			ctermbg = 0,
			fg = "#993939",
			bg = "#31353f",
		},
		logpoing = {
			ctermbg = 0,
			fg = "#61afef",
			bg = "#31353f",
		},
		stopped = {
			ctermbg = 0,
			fg = "#98c379",
			bg = "#31353f",
		},
	}

	vim.api.nvim_set_hl(0, "DapBreakpoint", dap_breakpoint_color.breakpoint)
	vim.api.nvim_set_hl(0, "DapLogPoint", dap_breakpoint_color.logpoing)
	vim.api.nvim_set_hl(0, "DapStopped", dap_breakpoint_color.stopped)
	local dap_breakpoint = {
		error = {
			text = "",
			texthl = "DapBreakpoint",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		},
		condition = {
			text = "ﳁ",
			texthl = "DapBreakpoint",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		},
		rejected = {
			text = "",
			texthl = "DapBreakpint",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		},
		logpoint = {
			text = "",
			texthl = "DapLogPoint",
			linehl = "DapLogPoint",
			numhl = "DapLogPoint",
		},
		stopped = {
			text = "",
			texthl = "DapStopped",
			linehl = "DapStopped",
			numhl = "DapStopped",
		},
	}
	fn.sign_define("DapBreakpoint", dap_breakpoint.error)
	fn.sign_define("DapBreakpointCondition", dap_breakpoint.condition)
	fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
	fn.sign_define("DapLogPoint", dap_breakpoint.logpoint)
	fn.sign_define("DapStopped", dap_breakpoint.stopped)

	local dap, dapui = require("dap"), require("dapui")
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

return M