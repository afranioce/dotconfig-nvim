-- local function restore_nvim_tree()
--     local nvim_tree = require("nvim-tree")
--     nvim_tree.change_dir(vim.fn.getcwd())
--     nvim_tree.refresh()
-- end

require("auto-session").setup({
    log_level = vim.log.levels.ERROR,
    auto_session_suppress_dirs = { "~/Projects" },
    -- post_restore_cmds = { restore_nvim_tree },
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
        require("lualine").refresh()   -- refresh lualine so the new session name is displayed in the status bar
    end,
})