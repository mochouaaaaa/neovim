local M = {}

function M.on_attach(client, buffer)
	vim.g.syntastic_python_checkers = { "mypy" }

	-- local rc = client.resolver_capabilities()
	--
	-- if client.name == "pyright" then
	-- 	rc.hover = false
	-- end
	--
	-- if client.name == "pylsp" then
	-- 	rc.rename = false
	-- 	rc.signature_help = false
	-- end
end

return M
