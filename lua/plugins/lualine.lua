require("lualine").setup({
	options = {
		-- theme = 'dracula'
		theme = "catppuccin",
		-- theme = 'nord'
	},
    globalstatus = true,
	sections = {
		lualine_b = {
			{
				"branch",
				fmt = function(str)
					if vim.api.nvim_strwidth(str) > 40 then
						return ("%s…"):format(str:sub(1, 39))
					end

					return str
				end,
			},
			"diff",
			"diagnostics",
		},
		lualine_c = {
			"require'lsp-status'.status()",
		},
	},
	extensions = { "nvim-tree", "quickfix", "toggleterm", "nvim-dap-ui" },
})
