local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
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

vim.api.nvim_create_augroup("LazygitProjectRootDir", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = require("lazygit.utils").project_root_dir,
    group = "LazygitProjectRootDir",
    desc = "Lazygit Project Root Dir",
})

-- Load extensions
telescope.load_extension("project")
telescope.load_extension("lazygit")

-- telescope.lsp_workspace_symbols =  function()
--   local input = vim.fn.input('Query: ')
--   cmd('normal :esc<CR>')
--   cmd('echom "' .. input .. '"')
--   if not input or #input == 0 then return end
--   require('telescope.builtin').lsp_workspace_symbols{
--       query = input
--   }
-- end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-p>", telescope.extensions.project.project, opts)
vim.keymap.set("n", "<leader>lg", telescope.extensions.lazygit.lazygit, opts)
vim.keymap.set("n", "<leader>e", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<leader>w", builtin.lsp_dynamic_workspace_symbols, opts)
vim.keymap.set("n", "<leader><leader>", builtin.keymaps, opts)
vim.keymap.set("n", "<Leader>gt", builtin.git_status, opts)
vim.keymap.set("n", "<Leader>cm", builtin.git_commits, opts)
vim.keymap.set("n", "<Leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<Leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<Leader>fo", function()
    builtin.oldfiles({ only_cwd = true })
end, opts)
vim.keymap.set("n", "gr", builtin.lsp_references, opts)
-- vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)