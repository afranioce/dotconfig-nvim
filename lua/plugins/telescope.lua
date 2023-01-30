local opts = { noremap = true, silent = true }

require("telescope").setup({
	defaults = {
		path_display = { "shorten" },
	},
	extensions = {
		project = {
			base_dirs = {
				{ "~/Projects", max_depth = 5 },
			},
		},
	},
})

-- load extensions
require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")

-- telescope.lsp_workspace_symbols =  function()
--   local input = vim.fn.input('Query: ')
--   cmd('normal :esc<CR>')
--   cmd('echom "' .. input .. '"')
--   if not input or #input == 0 then return end
--   require('telescope.builtin').lsp_workspace_symbols{
--       query = input
--   }
-- end

vim.keymap.set("n", "<leader>e", function()
	require("telescope.builtin").lsp_document_symbols()
end, opts)
vim.keymap.set("n", "<leader>w", function()
	require("telescope.builtin").lsp_dynamic_workspace_symbols()
end, opts)
vim.keymap.set("n", "<leader><leader>", function()
	require("telescope.builtin").keymaps()
end, opts)
vim.keymap.set("n", "<Leader>gt", function()
	require("telescope.builtin").git_status()
end, opts)
vim.keymap.set("n", "<Leader>cm", function()
	require("telescope.builtin").git_commits()
end, opts)
vim.keymap.set("n", "<Leader>ff", function()
	require("telescope.builtin").find_files()
end, opts)
vim.keymap.set("n", "<Leader>fg", function()
	require("telescope.builtin").live_grep()
end, opts)
vim.keymap.set("n", "<Leader>fb", function()
	require("telescope.builtin").buffers()
end, opts)
vim.keymap.set("n", "<Leader>fh", function()
	require("telescope.builtin").help_tags()
end, opts)
vim.keymap.set("n", "<Leader>fo", function()
	require("telescope.builtin").oldfiles()
end, opts)
vim.keymap.set("n", "gr", function()
	require("telescope.builtin").lsp_references()
end, opts)
vim.keymap.set("n", "gd", function()
	require("telescope.builtin").lsp_definitions()
end, opts)
vim.keymap.set("n", "gi", function()
	require("telescope.builtin").lsp_implementations()
end, opts)

-- Extensions shortcut
vim.keymap.set("n", "<C-p>", function()
	require("telescope").extensions.project.project({})
end, opts)
vim.keymap.set("n", "<space>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end, opts)
