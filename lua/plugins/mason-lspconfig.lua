local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local lsp_status = require("lsp-status")

lsp_status.config({
	diagnostics = false,
	current_function = false,
	status_symbol = "",
})

require("mason").setup()
mason_lspconfig.setup({
	ensure_installed = {
		"bashls",
		"omnisharp",
		"jsonls",
		"yamlls",
		"vimls",
		"sumneko_lua",
		"phpactor",
		"tsserver",
		"cmake",
		"sqls",
		"gopls",
		"eslint",
		"angularls",
		"zk",
		"pylsp",
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "LspAttached",
	desc = "LSP actions",
	callback = function()
		local opts = { buffer = true }
		local telescope_builtin = require("telescope.builtin")
		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<space>q", function()
			telescope_builtin.diagnostics()
		end, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", function()
			telescope_builtin.lsp_implementations()
		end, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "gr", function()
			telescope_builtin.lsp_references()
		end, opts)
		vim.keymap.set("n", "ge", function()
			telescope_builtin.lsp_document_symbols()
		end, opts)
		vim.keymap.set("n", "gw", function()
			telescope_builtin.lsp_workspace_symbols()
		end, opts)
		vim.keymap.set("n", "<space>f", vim.lsp.buf.format, opts)
	end,
})

-- Register the progress handler
lsp_status.register_progress()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- LSP settings (for overriding per client)
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
	["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			prefix = "",
			spacing = 0,
		},
		signs = true,
		underline = true,
		-- set this to true if you want diagnostics to show in insert mode
		update_in_insert = false,
	}),
}

local lsp_defaults = {
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
    handlers = handlers,
	on_attach = function(client, bufnr)
        lsp_status.on_attach(client)

		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })

		if client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = vim.lsp.buf.document_highlight,
				buffer = bufnr,
				group = "lsp_document_highlight",
				desc = "Document Highlight",
			})
			vim.api.nvim_create_autocmd("CursorMoved", {
				callback = vim.lsp.buf.clear_references,
				buffer = bufnr,
				group = "lsp_document_highlight",
				desc = "Clear All the References",
			})
		end

        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = "rounded",
                    source = "always",
                    prefix = " ",
                    scope = "cursor",
                }
                vim.diagnostic.open_float(nil, opts)
            end,
        })


		-- TODO: remove when mason to implement helm_ls
		if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "gotmpl" then
			vim.diagnostic.disable()
		end

		if client.server_capabilities.codeLensProvider then
			vim.api.nvim_create_augroup("lsp_codelens", { clear = true })
			vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
				callback = vim.lsp.codelens.refresh,
				buffer = bufnr,
				group = "lsp_codelens",
				desc = "Code Lens",
			})
		end
	end,
}

lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

mason_lspconfig.setup_handlers({
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({})
	end,

	-- override default handler (optional)
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
					telemetry = { enable = false },
				},
			},
		})
	end,
})
