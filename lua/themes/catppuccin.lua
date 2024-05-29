require("catppuccin").setup({
	flavour = "macchiato",
	transparent_background = false,
	integrations = {
		treesitter = true,
		cmp = true,
		telescope = {
			enabled = true,
			-- style = "nvchad"
		},
		dashboard = true,
		mason = true,
		nvimtree = true,
		notify = true,
		treesitter_context = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dap = {
			enabled = true,
			enable_ui = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
			inlay_hints = {
				background = true,
			},
		},
		bufferline = {
			enabled = true,
			italics = true,
			bolds = true,
		},
	},
})

vim.o.cursorline = true
vim.cmd.colorscheme("catppuccin")
