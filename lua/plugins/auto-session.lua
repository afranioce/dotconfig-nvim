-- local function restore_nvim_tree()
--     local nvim_tree = require("nvim-tree")
--     nvim_tree.change_dir(vim.fn.getcwd())
--     nvim_tree.refresh()
-- end

require("auto-session").setup({
  log_level = vim.log.levels.WARN,
  auto_session_enabled = true,
  auto_session_create_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_use_git_branch = true,
  auto_session_suppress_dirs = { "~/Projects" },
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
