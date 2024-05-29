vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_win_position = "right"
vim.g.db_ui_winwidth = "60"
vim.g.db_ui_env_variable_url = 'DATABASE_URL'
-- g.db_ui_debug = 1

vim.g.completion_matching_ignore_case = true
vim.g.completion_chain_complete_list = {
    sql = {
        { complete_items = { "vim-dadbod-completion" } },
    },
}

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("DadbodCompletion", {}),
    pattern = { "sql", "mysql", "plsql" },
    callback = function()
        require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
    end,
})

vim.api.nvim_set_keymap("n", "<leader>d", ":DBUIToggle<CR>", { noremap = true, silent = true })
