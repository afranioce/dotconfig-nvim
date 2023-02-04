local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

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

vim.keymap.set("n", "<C-p>", function()
    telescope.extensions.project.project()
end, opts)
vim.keymap.set("n", "<leader>lg", function()
    telescope.extensions.lazygit.lazygit()
end, opts)
vim.keymap.set("n", "<leader>e", function()
    telescope_builtin.lsp_document_symbols()
end, opts)
vim.keymap.set("n", "<leader>w", function()
    telescope_builtin.lsp_dynamic_workspace_symbols()
end, opts)
vim.keymap.set("n", "<leader><leader>", function()
    telescope_builtin.keymaps()
end, opts)
vim.keymap.set("n", "<Leader>gt", function()
    telescope_builtin.git_status()
end, opts)
vim.keymap.set("n", "<Leader>cm", function()
    telescope_builtin.git_commits()
end, opts)
vim.keymap.set("n", "<Leader>ff", function()
    telescope_builtin.find_files()
end, opts)
vim.keymap.set("n", "<Leader>fg", function()
    telescope_builtin.live_grep()
end, opts)
vim.keymap.set("n", "<Leader>fb", function()
    telescope_builtin.buffers()
end, opts)
vim.keymap.set("n", "<Leader>fh", function()
    telescope_builtin.help_tags()
end, opts)
vim.keymap.set("n", "<Leader>fo", function()
    telescope_builtin.oldfiles()
end, opts)
vim.keymap.set("n", "gr", function()
    telescope_builtin.lsp_references()
end, opts)
-- vim.keymap.set("n", "gd", function() telescope_builtin.lsp_definitions() end, opts)
vim.keymap.set("n", "gi", function()
    telescope_builtin.lsp_implementations()
end, opts)
