vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_win_position = "right"
vim.g.db_ui_winwidth = "60"
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

vim.g.dbs = {
    ['FSC Staging'] = "mysql://amartins:uRK9J63sp5zj@gsc-staging-aurora-db-mysql.cluster-cu177eqth0rp.us-east-1.rds.amazonaws.com/gsc_staging",
    ['FSC Prod'] = "mysql://amartins:pR8s4TJY6u5c@gsc-prod-aurora-db-mysql.cluster-cu177eqth0rp.us-east-1.rds.amazonaws.com/gsc_production",
    ['FSC QA PosSales'] = "mysql://amartins:uRK9J63sp5zj@gsc-qa-postsales-aurora-db-mysql.cluster-cu177eqth0rp.us-east-1.rds.amazonaws.com/gsc_staging",
    ['FSC Local Dev'] = "mysql://root@127.0.0.1/gsc_sellercenter",
    ['FSC Local Test'] = "mysql://root@127.0.0.1/gsc_sellercenter_test",
    ['Hydra Order Staging'] = "postgres://app-user-20ary0kn:3{]hj-L5s>F=6h}n@127.0.0.1/order",
    ['Hydra Order Prod'] = "postgres://dev-read-user:SIhmDm=2evO8Hfs>@127.0.0.1/order",
}

vim.api.nvim_set_keymap("n", "<leader>d", ":DBUIToggle<CR>", { noremap = true, silent = true })