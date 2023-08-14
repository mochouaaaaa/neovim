local env = require("plugins.dap.env")

return {
	config = function(dap)
		dap.adapters.python = {
			type = "executable",
			command = env.pythonPath(),
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python",
			},
		}

		dap.configurations.python = {
			{
				type = "python",
				name = "Debug Single File",
				request = "launch",
				-- This configuration will launch the current file if used.
				program = "${file}",
				cwd = "${workspaceFolder}",
				pythonPath = function()
					-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
					-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
					-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
					local cwd = vim.fn.getcwd()
					if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
						return cwd .. "/venv/bin/python"
					elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
						return cwd .. "/.venv/bin/python"
					else
						return env.pythonPath()
					end
				end,
			},
			{
				type = "python",
				request = "launch",
				name = "Django",
				program = vim.fn.getcwd() .. "/manage.py",
				pythonPath = env.pythonPath(),
				args = { "runserver", "--noreload" },
			},
		}
	end,
}
