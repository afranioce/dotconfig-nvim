local opts = { noremap = true, silent = true }

local dap = require("dap")

dap.set_log_level("TRACE")

dap.adapters.php = {
	type = "executable",
	name = "php",
	command = "php-debug-adapter",
}

dap.adapters.node = {
	type = "executable",
	name = "node",
	command = "node-debug2-adapter",
}

-- Chrome
dap.adapters.chrome = {
	type = "executable",
	name = "chrome",
	command = "chrome-debug-adapter",
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = 9000,
		pathMappings = {
			["/usr/share/sellercenter/"] = "${workspaceFolder}",
		},
	},
	-- {
	-- 	type = "php",
	-- 	request = "launch",
	-- 	name = "Launch currently open script",
	-- 	port = 9000,
	--    log = true,
	--    program = "${file}",
	--    cmd = "${fileDirname}",
	-- },
}
dap.configurations.javascript = {
	{
		name = "Launch Program",
		type = "node",
		request = "launch",
		program = "${file}",
		cwd = "${workspaceFolder}",
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

-- add support to Visual Studio Code launch.json
-- require'dap.ext.vscode'.load_launchjs()

---- Keymap based on Vistual Studio https://docs.microsoft.com/en-us/visualstudio/ide/default-keyboard-shortcuts-in-visual-studio?view=vs-2019
vim.keymap.set("n", "<F5>", dap.continue, opts)
vim.keymap.set("n", "<F6>", dap.terminate, opts)
-- vim.keymap.set("n", "<C-S-F5>", function()
-- 	dap.disconnect({ restart = true })
-- end, opts) -- Restart
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<F10>", dap.step_over, opts)
vim.keymap.set("n", "<C-F10>", dap.run_to_cursor, opts)
vim.keymap.set("n", "<F11>", dap.step_into, opts)
vim.keymap.set("n", "<S-F11>", dap.step_out, opts)

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("dm__dap_repl", { clear = true }),
	pattern = "dap-repl",
	callback = function()
		require("dap.ext.autocompl").attach()
	end,
	desc = "DAP: REPL completion",
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "ﳁ", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })
