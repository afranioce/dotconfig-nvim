
-- local function restore_nvim_tree()
--     require("nvim-tree.api").tree.open({ focus = false })
-- end

require("auto-session").setup({
    log_level = "error",
    auto_session_suppress_dirs = { "~/Projects" },
    -- post_restore_cmds = { restore_nvim_tree },
})
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
